Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dashboard#show'
  resources :sessions, only: [:create, :new]
  delete 'session', to: 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]
  resources :movies, only: [:index]
  resource :dashboard, only: [:show]
end
