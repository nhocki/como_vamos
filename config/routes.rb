Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/regwall' => 'welcome#regwall'
  root 'welcome#index'
end
