class RelationshipsController < ApplicationController
  
  # ＝＝＝＝＝＝＝フォローする処理＝＝＝＝＝＝＝
  def create
    current_user.follow(params[:user_id])
                  # ↑ followメソッドはmodel/user.rb内に定義
    redirect_to request.referer
    # ↓↓↓ followメソッドを定義せず、省略もしない記述の仕方 ↓↓↓
    # follow = current_user.active_relationships.new(follower_id: params[:user_id])
    # follow.save
    # redirect_to request.referer
    
  end
  # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  
  
  # ＝＝＝＝＝＝＝フォロー外す処理＝＝＝＝＝＝＝
  def destroy
    current_user.unfollow(params[:user_id])
                  # ↑ unfollowメソッドはmodel/user.rb内に定義
    redirect_to request.referer
    
    # ↓↓↓ unfollowメソッドを定義せず、省略もしない記述の仕方 ↓↓↓
    # follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    # follow.destroy
    # redirect_to request.referer
    
  end
  # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  
  
  

end
