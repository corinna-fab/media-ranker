Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pizzas#top'

  # get '/login', to: 'users#login_form', as: "login"
  # post '/login', to: 'users#login'
  # post '/logout', to: 'users#logout', as: "logout"

  # get 'users/current', to: 'users#current', as: "current_user"

  # get '/top', to: 'pizzas#top', as: "top_pizzas"
  
  # resources :votes, except: [:destroy, :update, :edit, :new]
    
  # resources :pizzas
  
  # resources :users, except: [:destroy, :edit, :new]

  # post "/pizzas/:id/upvote", to: "pizzas#upvote", as: "upvote"

  # root 'pages#home'
  # get 'pages/home'

  resources :pizzas
  resources :users, only: [:index, :show]

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"
  get "/users/current", to: "users#current", as: "current_user"

  # patch "/works/:id/upvote", to: "works#upvote", as: "upvote"
  post "/pizzas/:id/upvote", to: "pizzas#upvote", as: "upvote"
end
