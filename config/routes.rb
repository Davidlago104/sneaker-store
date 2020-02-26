Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/auth/github/callback' => 'sessions#omniauth'

  delete '/logout' => 'sessions#destroy'


  resources :reviews
  resources :sneakers do
    resources :reviews, only: [:new, :index]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
