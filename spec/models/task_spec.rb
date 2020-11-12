require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should not close from other user' do
    task_list = create(:task_list_with_tasks)
    user = create(:user)
    task_list.tasks.first.close(user.id)
    expect(task_list.tasks.first.open).to eq(true)
  end
end
