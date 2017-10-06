Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'welcome#home'

  get 'signin' => 'sessions#new', as: :login
  post 'sessions/create' => 'sessions#create', as: :sessions
end
