Rails.application.routes.draw do
  get '/regwall' => 'welcome#regwall'
  root 'welcome#index'
end
