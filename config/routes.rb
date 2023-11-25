Rails.application.routes.draw do
  devise_for :users
  resources :todos, only: [:index, :create, :update]
  root to: 'todos#index'
end
