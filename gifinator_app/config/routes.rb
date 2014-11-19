Rails.application.routes.draw do
resources :users 
resources :gifs, only: [:create, :index, :show, :new, :destroy]
resources :tags, only: [:edit, :destroy]
resources :comments, only: [:new, :edit, :destroy]
end
