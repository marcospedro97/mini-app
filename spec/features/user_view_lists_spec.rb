require 'rails_helper'

describe 'user view lists' do
  context 'public' do
    it 'successfully' do
      # ARRANGE
      user = create(:user)
      create_list(:task_list, 5, public: true)
      create_list(:task_list, 6, public: false)
      # ACT
      login_as user, scope: :user
      visit root_path
      click_on 'Listas públicas'
      # ASSERT
      expect(all('.list').count).to eq(5)
    end

    it 'should be authenticated' do
      # ARRANGE
      create_list(:task_list, 5, public: true)
      # ACT
      visit task_lists_path
      # ASSERT
      expect(current_path).to eq(new_user_session_path)
    end
  end

  context 'private' do
    it 'successfully' do
      # ARRANGE
      user = create(:user)
      create_list(:task_list, 5, user_id: user.id, public: false)
      create_list(:task_list, 6, public: true)
      # ACT
      login_as user, scope: :user
      visit root_path
      click_on 'Minhas listas'
      # ASSERT
      expect(all('.list').count).to eq(5)
    end

    it 'should be authenticated' do
      # ARRANGE
      create_list(:task_list, 5, public: true)
      # ACT
      visit user_task_lists_path(1)
      # ASSERT
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
