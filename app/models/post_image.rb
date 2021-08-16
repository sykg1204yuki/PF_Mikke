class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :area
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :discovers, dependent: :destroy

  has_many_attached :images
  
  # 引数で渡されたユーザidがFavoritesテーブル内に存在するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    
  end
  
  
  def discovered_by?(user)
    discovers.where(user_id: user.id).exists?
    
  end 

end
