Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pizzas#index'
  get '/login', to: 'users#login_form', as: "login"
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout', as: "logout"

  get 'users/current', to: 'users#current', as: "current_user"

  get 'pizzas/top', to: 'pizzas#top', as: "top_pizzas"
  
  resources :votes
    
  # resources :trips, except: [:index]
  resources :pizzas do
    resources :votes#, only: [:new, :show, :index]
  end
  
  resources :users 
  
  # get "/login", to: "users#login_form", as: "login"
  # post "/login", to: "users#login"
  # post "/logout", to: "users#logout", as: "logout"
  # get "/users/current", to: "users#current", as: "current_user"
end
