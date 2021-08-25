Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update] do
    
    # フォロー・フォロワー機能ルーティング
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    
    # 「いいね」した投稿検索機能ルーティング
    member do
      get :favorites
    end 
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
