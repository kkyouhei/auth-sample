Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:show]
    resources :user_sessions, only: [:create]
  end

  root :to => 'users#show'
  resources :user_sessions, only: [:create]
  resources :users, only: [:show]
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
end
