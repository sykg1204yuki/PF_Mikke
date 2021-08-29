class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  validates :name, presence: true, length: {in: 2..20}
  validates :encrypted_password, presence:true, length: {minimum: 6}
  validates :introduction, length: {maximum: 200}


  # 投稿機能リレーション
  has_many :post_images, dependent: :destroy

  # コメント機能リレーション
  has_many :post_comments, dependent: :destroy

  # いいね機能リレーション
  has_many :favorites, dependent: :destroy

  # 発見機能リレーション
  has_many :discovers, dependent: :destroy

  # フォロー・フォロワー機能リレーション
  has_many :active_relationships, class_name:"Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name:"Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following


  # relationshipコントローラにてcreateアクション時に使用するメソッド
  def follow(user_id)
    relationship = active_relationships.new(follower_id: user_id)
    relationship.save
    # 省略形・・・relationships.create(following_id: user_id)

  end


  # relationshipコントローラにてdestroyアクション時に使用するメソッド
  def unfollow(user_id)
    relationship = active_relationships.find_by(follower_id: user_id)
    relationship.destroy
    # 省略形・・・relationships.find_by(followed_id: user_id).destroy

  end


  # 引数のuserをフォローしているかどうかを判定するメソッド
  def followings?(user)
    followings.include?(user)

  end

  # プロフィール画像設定
  attachment :profile_image

  # ユーザー検索のためのメソッド
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end



end
