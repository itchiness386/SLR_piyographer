class Photo < ApplicationRecord

  attachment :image

  belongs_to :user
  has_many :photo_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :image_id, presence: true
  validates :date, presence: true
  validates :camera, presence: true
  validates :lens, presence: true
  validates :aperture, presence: true
  validates :ss, presence: true
  validates :iso, presence: true
  validates :wb, presence: true
  validates :focus, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
