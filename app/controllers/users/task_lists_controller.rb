module Users
  class TaskListsController < ApplicationController
    before_action :authenticate_user!

    def index
      @task_lists = current_user.task_lists
    end

    def show
      @task_list = current_user.task_lists.find(params[:id])
    end

    def new
      @task_list = current_user.task_lists.new
    end

    def create
      @task_list = current_user.task_lists.new(task_list_params)
      if @task_list.save
        return redirect_to user_task_list_path(current_user.id, @task_list),
                           notice: 'Lista de tarefas criada'
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
end
