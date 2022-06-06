Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :tags
  end
end