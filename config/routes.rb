Rails.application.routes.draw do

root to: 'users#new'

resources :users 
resources :gifs, only: [:create, :index, :show, :new, :destroy] do
	member do 
		post 'add_tag'
		post 'add_comment'
		delete 'remove_comment'
	end
end

resources :tags, only: [:destroy, :show]

 get 'sessions/new' => 'sessions#new', as: 'login'
  post 'sessions'    => 'sessions#create'
  delete 'sessions'  => 'sessions#destroy'
end
