class Users::UserFavoritesController < ApplicationController

  def index
    @user_favorites = UserFavorite.where(user_id: current_user.id)
  end

  def create
    UserFavorite.create(user_id: current_user.id, task_list_id: params[:task_list_id])
  end
end
