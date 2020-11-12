class AddOpenToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :open, :boolean, default: true
  end
end
