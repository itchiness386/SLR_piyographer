class Users::PhotoCommentsController < ApplicationController

  def create
  	photo = Photo.find(params[:photo_id])
    comment = PhotoComment.new(photo_comment_params)
    comment.user_id = current_user.id
    comment.photo_id = photo.id
    comment.save
    redirect_to photo_path(photo)
  end

  def destroy
  	photo = Photo.find(params[:photo_id])
    comment = PhotoComment.find(params[:id])
    comment.destroy
    redirect_to photo_path(photo)
  end

	private

	def photo_comment_params
	    params.require(:photo_comment).permit(:comment)
	end

end