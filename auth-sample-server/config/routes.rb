Rails.application.routes.draw do
  root :to => 'users#show'
  resources :user_sessions
  resources :users
  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
end
