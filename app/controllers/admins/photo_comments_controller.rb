class Admins::PhotoCommentsController < ApplicationController

  def destroy
  	photo = Photo.find(params[:photo_id])
    comment = PhotoComment.find(params[:id])
    comment.destroy
    redirect_to admins_photo_path(photo)
  end

end