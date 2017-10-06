Rails.application.routes.draw do
  resources :users
  resources :attractions
  resources :rides

  root 'welcome#home'
end
