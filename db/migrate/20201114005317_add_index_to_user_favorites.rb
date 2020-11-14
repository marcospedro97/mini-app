class AddIndexToUserFavorites < ActiveRecord::Migration[6.0]
  def change
    add_index :user_favorites, [:user_id, :task_list_id], unique: true
  end
end
