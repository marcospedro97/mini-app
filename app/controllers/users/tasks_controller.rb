class Users::TasksController < ApplicationController
  def close
    @task = Task.find(params[:id])
    @task.close(current_user.id)
  end
end
