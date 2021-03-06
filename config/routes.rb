Qwikstubs::Application.routes.draw do

  resources :users
  resources :charges
  scope "api" do
    resources :venues
    resources :events
    resources :orders
    get '/events/seats/:id' => 'events#seats'
    get '/events/sections/:id' => 'events#sections'
    get '/events/:id/purchase' => 'events#purchase_reroute'
    get '/events/order/reserve/:id/:total' => 'events#order_reserve_mock'
    get '/events/order/release/:id/:total' => 'events#order_release_mock'
    get '/events/order/best/:event/:amount' => 'orders#select_best_seats'
    get '/orders/seats/:id' => 'orders#seats'
    get '/search/events' => 'events#search'
    post '/orders/:id/purchase' => 'orders#purchase'
  end
  
  resources :sessions, only: [:new, :create, :destroy]

  # Helpful aliases for routes
  match 'login'  => 'sessions#new',     as: 'login'
  match 'logout' => 'sessions#destroy', as: 'logout'
  match 'create_venue' => 'venues#new', as: 'create_venue'
  match 'create_event' => 'events#new', as: 'create_event'
  get '/orders/:id/checkin' => 'orders#checkin'

  get '/register' => 'users#new'
  
  #get '/venue/create' => 'venues#new'
  #get '/venue/show/:name' => 'venues#show'
  #get '/venue' => 'venues#list'


  root :to => 'application#index'
  # match '*path', to: 'application#index'
end
