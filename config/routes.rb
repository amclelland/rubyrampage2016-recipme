Rails.application.routes.draw do
  devise_for :users
  root to: 'site#index'

  resources :meals, only: [:index]

  namespace :api do
    resources :meals, only: [:index, :create, :destroy, :update]
  end
end
