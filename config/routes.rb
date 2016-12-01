Rails.application.routes.draw do
  resource  :profile,     only: [ :show, :update ]
  resources :users,       only: [ :index, :show ]
  resources :judges,      only: [ :index, :show, :new, :create ]
  resources :categories,  only: [ :show ]

  resources :problems, only: [ :index, :show, :new, :create ] do
    resources :solutions, only: [ :new, :create, :edit, :update ]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy', as: :logout
  get '/regwall', to: 'welcome#regwall', as: :regwall
  get '/.well-known/acme-challenge/:id', to: 'welcome#letsencrypt'
  root 'welcome#index'
end
