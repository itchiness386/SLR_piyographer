class Users::PhotoCommentsController < ApplicationController

  def create
  	@photo = Photo.find(params[:photo_id])
    @comment = PhotoComment.new(photo_comment_params)
    @comment.user_id = current_user.id
    @comment.photo_id = @photo.id
    if @comment.save
      redirect_to photo_path(@photo)
      flash[:notice] = "コメントを投稿しました"
    else
      @photo = Photo.find(params[:photo_id])
      @photo_comment = PhotoComment.new(photo_comment_params)
      render 'users/photos/show'
    end
  end

  def destroy
  	photo = Photo.find(params[:photo_id])
    comment = PhotoComment.find(params[:id])
    comment.destroy
    redirect_to photo_path(photo)
    flash[:notice] = "コメントを削除しました"
  end

	private

	def photo_comment_params
	    params.require(:photo_comment).permit(:comment)
	end

end
