Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/main', to: 'users#main'
  resources :users, except: [:index]
  resources :listings
  resources :categories, only: [:index, :show]
end
