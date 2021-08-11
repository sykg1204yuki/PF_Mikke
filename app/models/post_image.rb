class PostImage < ApplicationRecord

  belongs_to :user
  # belongs_to :area 

  attachment :image

end
