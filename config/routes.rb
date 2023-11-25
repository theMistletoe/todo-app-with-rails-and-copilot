Rails.application.routes.draw do
  resources :todos, only: [:index, :create, :update]
  root to: 'todos#index'
end
