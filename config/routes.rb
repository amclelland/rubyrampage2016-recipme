Rails.application.routes.draw do
  devise_for :users
  root to: 'site#index'
  get '/dashboard', to: 'dashboard#show', as: 'user_root'

  resources :meals do
    resources :ingredients, except: [:index]
  end

  # namespace :api do
  #   resources :meals, only: [:index, :create, :destroy, :update]
  # end
end
