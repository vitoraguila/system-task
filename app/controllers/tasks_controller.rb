class TasksController < ApplicationController
  before_action :authenticate_user!

  before_action :set_task, only: [:show, :destroy, :update, :status]
  before_action :is_owner?, only: [:destroy, :update]

  def show
  end

  def new
    @task = Task.new
  end

  def index
    # @tasks = current_user.task
    @tasks = Task.where(type_status: 0).order("task_date ASC")
  end

  def recent
    @tasks = Task.recent
    render action: :index
  end

  def mytasks
    @tasks = Task.mytasks(current_user)
    render action: :index
  end

  def alltasks
    @tasks = Task.alltasks
    render action: :index    
  end

  def status
    @task.update_attribute(:status, 1)
    redirect_to task_path(@task.id), :notice => "Finished task"  
  end

  def create
    @task = Task.new(task_params)
    # @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_path(@task.id), notice: "The task (#{@task.title}) has been created." }
      else
        format.html { render :new }
      end
    end

  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { render json: true }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    task_name = @task.title

    if @task.destroy
      redirect_to tasks_path, notice: "The task (#{task_name}) was deleted success"
    else
      render :index
    end
  end

  def action_reload_painel
    render :partial => "tasks/shared/paineltask"
  end
  
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :user, :type_status, :status, :task_date, :task_hour).merge(user: current_user)
  end

  def is_owner?
    unless current_user == @task.user
      respond_to do |format|
        format.json { render json: false, status: :forbidden }
        format.html { redirect_to main_app.root_url }
      end
    end
  end
end