class UsersController < ApplicationController

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
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)

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

  # ユーザーのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end


end
