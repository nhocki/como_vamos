Rails.application.routes.draw do
  resources :users, only: [ :index, :show ]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/regwall' => 'welcome#regwall', as: :regwall
  root 'welcome#index'
end
