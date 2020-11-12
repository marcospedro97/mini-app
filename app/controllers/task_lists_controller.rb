class TaskListsController < ApplicationController
  def show
    @task_list = TaskList.find(params[:id])
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)
    @task_list.user = current_user
    if @task_list.save
      return redirect_to @task_list, notice: 'Lista de tarefas criada'
    end

    render :new
  end

  private

  def task_list_params
    params.require(:task_list)
          .permit(
            :title, :description, :public,
            tasks_attributes: [:title, :description,
                               subtasks_attributes: %i[title description]]
          )
  end
end
