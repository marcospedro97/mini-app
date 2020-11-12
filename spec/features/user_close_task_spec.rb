require 'rails_helper'

describe 'user close task' do
  scenario 'successfully', js: true do
    # ARRANGE
    user = create(:user)
    task_list = create(:task_list, user: user)
    create_list(:task, 5, task_list_id: task_list.id)
    # ACT
    login_as user, scope: :user
    visit root_path
    click_on 'Minhas listas'
    click_on task_list.title
    first_task = all('.task').first
    within(first_task) do
      click_on 'Fechar tarefa'
    end
    # ASSERT
    expect(Task.where(task_list_id: task_list.id, open: false).count).to eq(1)
  end
end
