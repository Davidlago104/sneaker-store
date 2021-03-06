Rails.application.routes.draw do
  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:github/callback' => 'sessions#create'



  resources :sneakers do
    resources :reviews, only: [:new, :index, :show, :create]
  end
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# write a review outside nav bar
# write a review should only be on the sneaker page
