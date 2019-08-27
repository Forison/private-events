Rails.application.routes.draw do
  # get 'events/new'
  # post 'events/new', to: "events#create"
  # get 'events/show'
  # get 'events/index'
  get 'events',to: "events#index"
  post 'events', to: "events#attend_event"
  # get 'events/:id',to: "events#show"
  get 'home/index'
  get 'users/show' , to: "users#show"
  post 'users/show',to: "users#invite"
  # get 'users/:id',to: "users#show"
  # post 'users/:id',to: "users#invite"
  root "home#index"
  # post "events/new"

  resource :events
  resource :users
  resource :sessions
end
