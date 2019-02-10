Rails.application.routes.draw do
  root 'pets#index'

  resources :regions do
    resources :stores
  end

  resources :shelters do
    resources :pets, only: [:new, :create]
  end

  resources :users, only: [:new, :create]
  resources :pets, only: [:show, :index]
end
