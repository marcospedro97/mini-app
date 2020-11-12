class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
  has_many :subtasks, through: :tasks

  accepts_nested_attributes_for :subtasks
  accepts_nested_attributes_for :tasks
end
