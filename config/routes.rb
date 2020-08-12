Rails.application.routes.draw do
  root 'static#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :ingredients
  resources :users, only: [:index, :show, :create, :edit]
  resources :recipes, only: [:index, :show, :new, :edit, :destroy]
  resources :comments
  resources :likes
  resources :categories
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
