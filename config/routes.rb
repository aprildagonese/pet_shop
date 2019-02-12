Rails.application.routes.draw do
  root 'pets#index'

  resources :users, only: [:new, :create, :show]
  resources :pets, only: [:show, :index]
  resources :shelter, only: [:show, :index]

  namespace :admin do
    resources :pets, only: [:new, :create, :update, :destroy]
    resources :shelters, only: [:new, :create, :update, :destroy] do
      resources :pets, only: [:new, :create]
    end
    resources :regions do
      resources :stores
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
