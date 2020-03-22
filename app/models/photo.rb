class Photo < ApplicationRecord

  attachment :image

  belongs_to :user
  has_many :photo_comments, dependent: :destroy

end
