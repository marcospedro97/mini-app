class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  has_many :subtasks, through: :tasks

  accepts_nested_attributes_for :subtasks
  accepts_nested_attributes_for :tasks

  def self.find_with_user(id, user_id)
    task_list = find(id)
    return unless task_list.public || task_list.user_id == user_id

    task_list
  end
end
