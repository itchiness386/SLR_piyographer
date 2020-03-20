class Camera < ApplicationRecord

  belongs_to :user

  def camera_name
    "#{manufacturer} #{modelname}"
  end

end
