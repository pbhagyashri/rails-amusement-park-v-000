Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :destroy]
  resources :attractions
  resources :rides

  root 'welcome#home'

  get 'signin' => 'sessions#new', as: :login
  post 'sessions/create' => 'sessions#create', as: :sessions
  # post 'users/destroy' => 'users#destroy', as: :logout
end
