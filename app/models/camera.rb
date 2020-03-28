class Camera < ApplicationRecord

  belongs_to :user

  validates :manufacturer, presence: true
  validates :modelname, presence: true

  def camera_name
    "#{manufacturer} #{modelname}"
  end

end
