Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  resources :post_images
  resources :areas, only: [:new, :create, :index, :edit, :update]
  
end
