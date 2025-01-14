class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy, :edit, :update]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.save
    redirect_to task_path(@task), notice: 'Task created!'
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task updated successfully!"
    else
      redirect_to tasks_path, alert: "Failed to update the task."
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
