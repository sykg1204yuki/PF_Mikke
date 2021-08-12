class PostImage < ApplicationRecord

  belongs_to :user
  # belongs_to :area
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  
  # 引数で渡されたユーザidがFavoritesテーブル内に存在するかどうか
  def favorited_by?(user)
                    # ↑user.idでもOK?
    favorites.where(user_id: user.id).exists?
    
  end

end
