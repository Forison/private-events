Rails.application.routes.draw do
  get 'attendance/new'
  resource :users
  resource :sessions
  resources :events

  get 'users/:id', to: 'users#show'

  root 'home#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'attendance/invite', to: 'attendances#invite'

  post 'events/attend', to: 'attendances#attend'
end
