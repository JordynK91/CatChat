Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  resources :users

  resources :blogs

  post '/login', to: 'sessions#create'

  get '/new', to: 'sessions#new'
  
  post '/logout', to: 'sessions#destroy'

end
