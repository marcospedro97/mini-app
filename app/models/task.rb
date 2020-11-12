class Task < ApplicationRecord
  belongs_to :task_list
  has_many :subtasks, dependent: :destroy
  accepts_nested_attributes_for :subtasks

  def close(user_id)
    return unless task_list.user_id == user_id

    subtasks.each do |subtask|
      subtask.open = false
    end
    self.open = false
    save
  end
end
