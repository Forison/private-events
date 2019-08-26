Rails.application.routes.draw do
  get 'events/new'
  post 'events/new', to: "events#create"
  get 'events/show'
  get 'events/index'
  get 'events',to: "events#index"
  get 'events/:id',to: "events#show"
  get 'show' , to: "users#show"
  get 'home/index'
  get '/users/show'
  get 'users',to: "users#index"
  get 'users/:id',to: "users#show"
  root "home#index"
  post "events/new"
  resource :users
  resource :sessions
end
