class DiscoversController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    discover = @post_image.discovers.new(user_id: current_user.id)
    discover.save
    # redirect_to post_image_path(@post_image.id)

  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    discover = @post_image.discovers.find_by(user_id: current_user.id)
    discover.destroy
    # redirect_to post_image_path(@post_image.id)

  end

end
