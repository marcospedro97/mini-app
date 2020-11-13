class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_lists = TaskList.where(public: true)
  end

  def show
    @task_list = TaskList.where(id: params[:id], public: true).take
  end
end
