Qwikstubs::Application.routes.draw do

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  # Helpful aliases for routes
  match 'login'  => 'sessions#new',     as: 'login'
  match 'logout' => 'sessions#destroy', as: 'logout'

  get '/register' => 'users#new'

  root :to => 'application#homepage'

end
