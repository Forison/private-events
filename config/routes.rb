# frozen_string_literal: true

Rails.application.routes.draw do
  get 'attendance/new'
  resource :users
  resource :sessions
  resource :events

  post 'events/new', to: 'events#create'
  get 'events/show', to: 'events#show'
  get 'events/:id', to: 'events#index'

  get 'users/:id', to: 'users#show'

  root 'home#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  post 'attendance/invite', to: 'attendances#invite'

  post 'attendance/attend', to: 'attendances#attend'

end
