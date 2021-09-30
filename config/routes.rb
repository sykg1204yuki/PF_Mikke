Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see

    root to: "homes#top"

    devise_for :users, controllers:{
      registrations: 'users/registrations',  #ゲストユーザーが削除機能を使用できない
      passwords: 'users/passwords'           #ゲストユーザーがパスワードの再設定ができない
    }

    # ゲストログイン
    devise_scope :user do
      post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end





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

    # get '/searches' => 'searches#search'
    get '/searches/:id' => 'searches#search', as: "searches"        #多言語化とクエリパラメータは相性が悪いのでパスパラメータを使う


  end


end
