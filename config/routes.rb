Rails.application.routes.draw do
  root to: 'site#index'

  resources :meals, only: [:index]

  namespace :api do
    resources :meals, only: [:index, :create, :destroy, :update]
  end
end
