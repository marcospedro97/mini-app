module Users
  class FavoritesController < ApplicationController
    def index
      @user_favorites = current_user.user_favorites
    end

    def create
      current_user.user_favorites.create(
        user_id: params[:user_id], task_list_id: params[:task_list_id]
      )
    end
  end
end
