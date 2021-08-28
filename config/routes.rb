Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see
    devise_for :users
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :followings, on: :member
      get :followers, on: :member
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


end
