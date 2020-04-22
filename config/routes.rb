Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  get '/signup' => 'clients#new'
  post '/signup' => 'clients#create' 
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/google_oauth2/callback' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :clients do 
    resources :appointments, only: [:show, :index, :new, :create, :edit, :update]
    resources :reviews, only: [:index]
  end 

  resources :appointments do 
    resources :reviews, except: [:index]
  end 

  resources :clients
  resources :reviews
  resources :services

end
