class UsersController < ApplicationController

  # ユーザー一覧画面表示
  def index
    @users = User.all
    
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

  # ユーザーのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end


end
