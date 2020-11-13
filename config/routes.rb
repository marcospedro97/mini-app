Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :task_lists do
    get 'user', on: :collection
    get 'public', on: :collection
  end
  resources :tasks, only: %i[] do
    put 'close', on: :member
  end
end
