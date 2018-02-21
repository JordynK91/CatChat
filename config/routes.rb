Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  get 'users/new'
  post 'users', to: 'users#create'

  post '/login', to: 'users#create_session'
  
  post '/logout', to: 'users#destroy_session'


end
