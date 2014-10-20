Rails.application.routes.draw do
  resource  :profile, only: [ :show, :update ]
  resources :users, only: [ :index, :show ]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/regwall' => 'welcome#regwall', as: :regwall
  root 'welcome#index'
end
