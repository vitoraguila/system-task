class TasksController < ApplicationController
  before_action :authenticate_user!

  before_action :set_task, only: [:show, :destroy, :update]
  before_action :is_owner?, only: [:destroy, :update]

  def show
  end

  def index
    @tasks = current_user.task
  end

  def create
    @task = Task.new(task_params)
    # @task.user = current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to "/tasks/#{@task.id}" }
      else
        format.html { redirect_to main_app.root_url, notice: @task.errors }
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
    @task.destroy

    respond_to do |format|
      format.json { render json: true }
    end
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