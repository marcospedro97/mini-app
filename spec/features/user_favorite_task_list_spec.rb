require 'rails_helper'

describe 'user favorite task list' do
  it 'successfully', js: true do
    # ARRANGE
    task_list = create(:task_list_with_tasks, public: true)
    user = create(:user)
    # ACT
    login_as user, scope: :user
    visit root_path
    click_on 'Listas públicas'
    click_on task_list.title
    click_on 'Favoritar'
    click_on 'Favoritas'
    # ASSERT
    expect(page).to have_content(task_list.title)
  end
end
