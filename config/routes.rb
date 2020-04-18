Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  get '/auth/google_oauth2/callback' => 'sessions#google'

  delete '/logout' => 'sessions#destroy'

  resources :clients do 
    resources :appointments, only: [:show, :index, :new, :create, :edit, :update]
  end 

  resources :appointments
  resources :reviews, except: [:index, :show]

end
