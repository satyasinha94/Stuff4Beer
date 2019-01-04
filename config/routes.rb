Rails.application.routes.draw do
  get    '/login',   to: 'sessions#login'
  get    '/register',   to: 'sessions#register'
  post   '/login',   to: 'sessions#create'
  post '/register', to: 'sessions#create_new'
  delete '/logout',  to: 'sessions#destroy'
  get '/main', to: 'users#main'
  get '/search', to: 'listings#search', as: 'search'
  resources :users, except: [:index]
  resources :listings
  resources :categories, only: [:index, :show]
  resources :comments, only: [:new, :create]
end
