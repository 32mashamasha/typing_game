Rails.application.routes.draw do
  #root to: 'homes#index'

  resources :homes, only: [:index] do
  	collection do
  		get :new_game
  		get :sort
  	end
  end

  resources :games do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
