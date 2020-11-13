class TaskListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @task_lists = TaskList.where(public: true)
  end

  def show
    @task_list = TaskList.find(params[:id])
  end
end
