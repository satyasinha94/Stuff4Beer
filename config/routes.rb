Rails.application.routes.draw do
  get '/main', to: 'users#main'
  resources :users, except: [:index]
  resources :listings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
