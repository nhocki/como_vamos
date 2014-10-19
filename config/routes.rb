Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/regwall' => 'welcome#regwall', as: :regwall
  root 'welcome#index'
end
