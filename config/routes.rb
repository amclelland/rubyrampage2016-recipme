Rails.application.routes.draw do
  devise_for :users
  root to: 'site#index'
  get '/dashboard', to: 'dashboard#show', as: 'user_root'
  get '/planner', to: 'planner#show', as: 'planner'
  get '/generate_list', to: 'list#generate', as: 'generate_list'
  get '/list', to: 'list#show', as: 'list'

  resources :meals do
    resources :ingredients, except: [:index]
  end

  resources :planned_meals, only: [:new, :create, :destroy]

  # namespace :api do
  #   resources :meals, only: [:index, :create, :destroy, :update]
  # end
end
