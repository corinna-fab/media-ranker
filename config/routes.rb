Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pizzas#index'
  resources :votes
    
  # resources :trips, except: [:index]

  resources :pizzas do
    resources :votes#, only: [:new, :show, :index]
  end
  
  resources :users
end
