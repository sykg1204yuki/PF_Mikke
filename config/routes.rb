Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :post_images do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :discovers, only: [:create, :destroy]
  end

  resources :areas, only: [:index]
  get '/map_areas' => 'areas#map_area'
  get '/searches' => 'searches#search'


end
