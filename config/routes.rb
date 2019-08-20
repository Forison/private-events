Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get 'events/index'
  get 'show' , to: "users#show"
  get 'home/index'
  root "home#index"
  resource :users
  resource :sessions
end
