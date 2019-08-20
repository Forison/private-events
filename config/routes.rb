Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get 'events/index'
  get 'show' , to: "users#show"
  get 'home/index'
  get '/users/show'
  root "home#index"
  post "events/new"
  resource :users
  resource :sessions
end
