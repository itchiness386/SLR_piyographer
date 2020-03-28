class Admins::PhotosController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@photos = Photo.order(created_at: :desc)
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  def update
  	photo = Photo.find(params[:id])
    if photo.update(photo_params)
      redirect_to admins_photo_path(photo)
      flash[:notice] = "投稿のステータス情報を更新しました"
    else
      render 'edit'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:status)
  end

end
