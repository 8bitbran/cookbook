Rails.application.routes.draw do
  root 'static#home'
  get '/profile', to: 'users#profile', as: 'profile'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :ingredients
  resources :users, only: [:index, :show, :create, :edit]
  resources :recipes do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create]
  end
  resources :categories, only: [:show]
  post '/recipes', to: 'recipes#create'
  get '/auth/facebook/callback' => 'sessions#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
