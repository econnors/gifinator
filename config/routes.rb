Rails.application.routes.draw do

root to: 'application#index'

resources :users 
resources :gifs, only: [:create, :index, :show, :new, :destroy]
resources :tags, only: [:edit, :destroy]
resources :comments, only: [:new, :edit, :destroy, :create]
end
