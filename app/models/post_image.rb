class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :area
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :discovers, dependent: :destroy

  has_many_attached :images

  validates :title, presence: true, length: {maximum: 50}
  validates :caption, presence: true, length: {maximum: 200}

  # 引数で渡されたユーザidがFavoritesテーブル内に存在するかどうか
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?

  end


  def discovered_by?(user)
    discovers.where(user_id: user.id).exists?

  end

  # キーワード検索のためのメソッド
  def self.search(search)
    if search
      where(['caption LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
