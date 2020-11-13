Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :task_lists, only: %i[index show]

  resources :users, only: %i[] do
    resources :task_lists, controller: 'users/task_lists'
    resources :tasks, controller: 'users/tasks' do
      put 'close', on: :member
    end
    resources :favorites, controller: 'users/favorites', only: %i[index create]
  end
end
