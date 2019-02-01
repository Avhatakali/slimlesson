class SubtasksController < ApplicationController

  def index
      @subtasks = Subtask.all
      @task = Task.find(params[:task_id])
  end

  def show
      @subtask = Subtask.find(params[:id])
      @task = @subtask.task
  end

  def new
      @task = Task.find(params[:task_id])
      @subtask = @task.subtasks.new
  end

  def edit
      @subtask = Subtask.find(params[:id])
      @task = @subtask.task
  end
  def create
      @task = Task.find(params[:task_id])
      @subtask = @task.subtasks.create(subtask_params)

      if @subtask.save
        redirect_to task_path(@task)
      else
        render 'new'
      end
  end

  def update
      @subtask = Subtask.find(params[:id])
      @task = @subtask.task

      if @subtask.update(subtask_params)
        redirect_to task_path(@task)
      else
        render 'edit'
      end
  end

  def destroy
      @subtask = Subtask.find(params[:id])
      @task = @subtask.task

      @subtask.destroy
      redirect_to task_path(@task)
  end

  private
    def subtask_params
        params.require(:subtask).permit(:name, :done)
    end
end
