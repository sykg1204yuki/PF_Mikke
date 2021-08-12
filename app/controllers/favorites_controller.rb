class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = post_image.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to post_image_path(post_image.id)
    
  end 
  
  def destroy
  end 
  
end
