Qwikstubs::Application.routes.draw do

  resources :users
  resources :venues
  resources :events


  resources :sessions, only: [:new, :create, :destroy]

  # Helpful aliases for routes
  match 'login'  => 'sessions#new',     as: 'login'
  match 'logout' => 'sessions#destroy', as: 'logout'
#  match 'create_venue' => 'venues#new', as: 'create_venue'

  get '/register' => 'users#new'
  get '/venue/create' => 'venues#new'
  get '/venue/show/:name' => 'venues#show'
  get '/venue' => 'venues#list'
  get '/event/create' => 'events#new'
  get '/event/show/:name' => 'events#show'
  get '/event' => 'events#list'

  root :to => 'application#homepage'

end
