Rails.application.routes.draw do
  resources :ingredients
  resources :users, only: [:index, :show, :new, :edit]
  resources :recipes, only: [:index, :show, :new, :edit, :destroy]
  resources :comments
  resources :likes
  resources :categories
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
