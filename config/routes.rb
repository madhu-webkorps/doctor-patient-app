Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/admin', to: 'admin#index'
  
  # get '/admin/new', to: 'admin#new'
  get '/doctor', to: 'doctors#index'
  post '/admin', to: 'admin#create'
  resources :admin
  resources :users
  post '/user', to: 'user#create'
end
