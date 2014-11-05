Rails.application.routes.draw do
  resource  :profile, only: [ :show, :update ]
  resources :users, only: [ :index, :show ]
  resources :judges, only: [ :index, :show, :new, :create ]
  resources :categories, only: [ :show ]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/regwall' => 'welcome#regwall', as: :regwall
  root 'welcome#index'
end
