class PostImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :ensure_current_user, only: [:edit, :upadate]

  # 新規投稿画面表示
  def new
    @post_image = PostImage.new

  end

  # 新規投稿の保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render 'new'
    end

  end

  # 投稿一覧画面表示
  def index
    @post_images = PostImage.all.search(params[:search])
    @areas = Area.all

  end

  # 投稿詳細画面表示
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  # 投稿編集画面表示
  def edit
    @post_image = PostImage.find(params[:id])

  end

  # 投稿編集内容更新
  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image.id)
    else
      render 'edit'
    end

  end

  # 投稿削除
  def destroy
    @post_image =PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path

  end


  # 投稿のストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit({images: []}, :title, :caption, :area_id)

  end

  def ensure_current_user
    post_image = PostImage.find(params[:id])
      if post_image.user != current_user
        redirect_to user_path(current_user)

      end
  end


end
