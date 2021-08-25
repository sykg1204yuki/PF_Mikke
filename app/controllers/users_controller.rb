class UsersController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

  # ユーザー一覧画面表示（検索機能付き）
  def index
    @users = User.all.search(params[:search])

  end

  # マイページ・ユーザー詳細画面表示
  def show
    @user = User.find(params[:id])

  end

  # ユーザー情報編集画面表示
  def edit
    @user =User.find(params[:id])

  end

  # ユーザー情報編集内容更新
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end

  end

  # フォローしているユーザー一覧表示
  def followings
    user = User.find(params[:id])
    @users = user.followings

  end


  # フォローされてる（フォロワー）ユーザー一覧表示
  def followers
    user = User.find(params[:id])
    @users = user.followers

  end


  # 「いいね」した投稿の一覧表示
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_image_id)
    @favorite_post_images = PostImage.find(favorites)

  end





  # ユーザーのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

  def ensure_current_user
    user = User.find(params[:id])
      if user != current_user
        redirect_to user_path(current_user)

      end
  end


end
