require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should close subtasks' do
    task_list = create(:task_list_with_tasks)
    first_task = task_list.tasks.first
    first_task.close(task_list.user_id)
    expect(first_task.open).to eq(false)
    expect(first_task.subtasks.first.open).to eq(false)
  end

  it 'should not close from other user' do
    task_list = create(:task_list_with_tasks)
    user = create(:user)
    first_task = task_list.tasks.first
    first_task.close(user.id)
    expect(first_task.open).to eq(true)
  end
end
