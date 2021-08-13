Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  resources :post_images do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :discovers, only: [:create, :destroy]
  end

  resources :areas, except: [:show]

end
