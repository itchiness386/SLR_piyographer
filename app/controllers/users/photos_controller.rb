class Users::PhotosController < ApplicationController

  def new
    @photo = Photo.new
    @cameras = Camera.where(user_id: current_user.id)
  end

  def create
  	photo = Photo.new(photo_params)
  	photo.user_id = current_user.id

    if params[:radio] == "1"
      photo.camera = params[:camera]
    elsif params[:radio] == "2"
      photo.camera = params[:photo][:camera]
    end

    if photo.save
      redirect_to photo_path(photo)
    else
      render 'new'
    end
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
    @cameras = Camera.where(user_id: current_user.id)
  end

  def update
    photo = Photo.find(params[:id])

    if params[:radio] == "1"
      params[:photo][:camera] = params[:camera]
    elsif params[:radio] == "2"
      params[:photo][:camera] = params[:new_camera]
    end

    if photo.update(photo_params)
      redirect_to photo_path(photo)
    else
      render 'edit'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to user_path(current_user)
  end

  private

  def photo_params
  	params.require(:photo).permit(:user_id, :image, :date, :camera, :lens, :aperture, :ss, :iso, :wb, :focus, :status)
  end

end
