class PostCommentsController < ApplicationController
  
  # コメント保存
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image.id)
    
  end 
  
  # コメント削除
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    comment = post_image.post_comments.find(params[:id])
    comment.destroy
    redirect_to post_image_path(post_image.id)
    
  end 
  
  
  # コメントのストロングパラメータ
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
    
  end 
  
end
