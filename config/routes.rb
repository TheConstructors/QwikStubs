Qwikstubs::Application.routes.draw do

  resources :users
  scope "api" do
    resources :venues
    resources :events
    get '/events/seats/:id' => 'events#seats'
  end


  resources :sessions, only: [:new, :create, :destroy]

  # Helpful aliases for routes
  match 'login'  => 'sessions#new',     as: 'login'
  match 'logout' => 'sessions#destroy', as: 'logout'
  match 'create_venue' => 'venues#new', as: 'create_venue'
  match 'create_event' => 'events#new', as: 'create_event'

  get '/register' => 'users#new'
  
  #get '/venue/create' => 'venues#new'
  #get '/venue/show/:name' => 'venues#show'
  #get '/venue' => 'venues#list'


  root :to => 'application#index'
  # match '*path', to: 'application#index'
end
