class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :task_list, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
