Rails.application.routes.draw do
  devise_for :users
  root to: 'welcomes#index'

  resources :homes, only: [:index] do
    collection do
      get :sort
    end
  end

  resources :games, only: [:create]

  resources :words, only: [:index]
end
