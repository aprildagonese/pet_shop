Rails.application.routes.draw do
  root 'pets#index'

  resources :users, only: [:new, :create, :show]
  resources :pets, only: [:show, :index]

  resources :regions do
    resources :stores
  end

  resources :shelters do
    resources :pets, only: [:new, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
