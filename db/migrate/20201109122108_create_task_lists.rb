class CreateTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :public, default: false
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
