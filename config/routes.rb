Rails.application.routes.draw do
  get  'events/new'
  post 'events/new', to: "events#create"
  get  'events/show'
  get  'events/index'
  post 'events/index', to: "events#attend_event"
  get  'home/index'
  get  'users/show' , to: "users#show"
  post 'users/show',to: "users#invite"
  root "home#index"

  resource :users
  resource :sessions
end
