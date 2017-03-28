Rails.application.routes.draw do
  resources :repos
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#index"

  get '/auth/github/callback', to: 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/users/new', to: 'users#new'
  get '/repos', to: 'repos#index'
  get '/repos/:id', to: 'repos#show'


end
