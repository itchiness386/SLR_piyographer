class Users::PhotosController < ApplicationController

  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update, :destroy]
  before_action :deleted_photo, except: [:new, :create]

  def new
    @photo = Photo.new
    @cameras = Camera.where(user_id: current_user.id)
  end

  def create
  	@photo = Photo.new(photo_params)
  	@photo.user_id = current_user.id

    if params[:radio] == "1"
      @photo.camera = params[:camera]
    elsif params[:radio] == "2"
      @photo.camera = params[:photo][:camera]
    end

    if @photo.save
      redirect_to photo_path(@photo)
      flash[:notice] = "写真を投稿しました"
    else
      @cameras = Camera.where(user_id: current_user.id)
      render 'new'
    end
  end

  def show
  	@photo = Photo.find(params[:id])
    @comment = PhotoComment.new
  end

  def edit
    @photo = Photo.find(params[:id])
    @cameras = Camera.where(user_id: current_user.id)
  end

  def update
    @photo = Photo.find(params[:id])

    if params[:radio] == "1"
      params[:photo][:camera] = params[:camera]
    elsif params[:radio] == "2"
      params[:photo][:camera] = params[:new_camera]
    end

    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
      flash[:notice] = "投稿情報を変更しました"
    else
      @cameras = Camera.where(user_id: current_user.id)
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

  def corrent_user
    @photo = Photo.find(params[:id])
    redirect_to user_path(current_user) unless @photo.user_id == current_user.id
  end

  def deleted_photo
    @photo = Photo.find(params[:id])
    redirect_to user_path(current_user) unless @photo.status == true
  end

end
