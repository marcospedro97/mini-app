require 'rails_helper'

describe 'user creates list' do
  scenario 'successfully', js: true do
    # ARRANGE
    user = create(:user)
    # ACT
    login_as user, scope: :user
    visit root_path
    click_on 'Criar lista de tarefas'
    fill_in 'Titulo', with: 'Minha lista legal'
    fill_in 'Descrição', with: 'Uma lista de coisas legais'
    click_on 'Adcionar tarefa'
    fill_in 'Nome da tarefa', with: 'Programar em ruby'
    fill_in 'Descrição da tarefa', with: 'Como fazer da maneira correta'
    click_on 'Adcionar subtarefa'
    fill_in 'Nome da subtarefa', with: 'Primeiro passo'
    fill_in 'Descrição da subtarefa', with: 'Criar teste de feature'
    click_on 'Criar lista'
    # ASSERT
    expect(page).to have_content('Minha lista legal')
    expect(page).to have_content('Uma lista de coisas legais')
    expect(page).to have_content('Programar em ruby')
    expect(page).to have_content('Como fazer da maneira correta')
    expect(page).to have_content('Primeiro passo')
    expect(page).to have_content('Criar teste de feature')
  end
end
