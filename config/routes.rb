Rails.application.routes.draw do
  root to: 'recipes#home'
  resources :recipes do
    resources :tags
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end