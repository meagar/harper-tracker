Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

  resources :changings
  resources :feedings
  resources :weights, as: :weigh_ins
  resources :pumpings
  
  get 'reports' => 'reports#index'

  get '/auth/google_oauth2/callback' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
end
