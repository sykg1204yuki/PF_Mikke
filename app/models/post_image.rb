class PostImage < ApplicationRecord

  belongs_to :user
  # belongs_to :area
  has_many :post_comments, dependent: :destroy

  attachment :image

end
