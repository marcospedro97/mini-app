class AddOpenToSubtasks < ActiveRecord::Migration[6.0]
  def change
    add_column :subtasks, :open, :boolean, default: true
  end
end
