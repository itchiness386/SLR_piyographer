class Admins::PhotosController < ApplicationController
  def index
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
    else
      render 'edit'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:status)
  end

end
