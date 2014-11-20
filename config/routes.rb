Rails.application.routes.draw do
resources :users 
resources :gifs, only: [:create, :index, :show, :new, :destroy] do
	member do 
		put 'remove_tag'
	end
end

resources :tags, only: [:show, :edit]
resources :comments, only: [:new, :edit, :destroy, :create]

 get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions'    => 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'
end
