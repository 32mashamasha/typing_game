Rails.application.routes.draw do
  devise_for :users
  root to: 'welcomes#index'

  resources :homes, only: [:index] do
  	collection do
  		get :new_game
  		get :sort
  	end
  end

  resources :games do
  end
end
