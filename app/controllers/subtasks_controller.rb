class SubtasksController < ApplicationController
  before_action :authenticate_user!, except: [:opened]

  before_action :set_subtask, only: [:show, :destroy, :update]
  before_action :is_owner?, only: [:destroy, :update]

  def create
    @subtask = Subtask.new(subtask_params)

    respond_to do |format|
      if @subtask.save
        format.json { render json: true }
      else
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subtask.destroy

    respond_to do |format|
      format.json { render json: true }
    end
  end

  def update
    respond_to do |format|
      if @subtask.update(subtask_params)
        format.json { render json: true }
      else
        format.json { render json: @subtask.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_subtask
    @subtask = Subtask.find(params[:id])
  end

  def subtask_params
    params.require(:subtask).permit(:description, :task, :status, :subtask_date, :subtask_hour)
  end

  def is_owner?
    unless current_user == @subtask.task.user
      respond_to do |format|
        format.json { render json: false, status: :forbidden }
      end
    end
  end
end