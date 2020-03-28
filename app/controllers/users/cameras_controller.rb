class Users::CamerasController < ApplicationController

  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update, :destroy]

  def index
  	@cameras = Camera.where(user_id: current_user.id)
  	@camera = Camera.new
  end

  def create
  	camera = Camera.new(camera_params)
  	camera.user_id = current_user.id
    if camera.save
      redirect_to cameras_path
    else
      @cameras = Camera.where(user_id: current_user.id)
      @camera = Camera.new(camera_params)
      render 'index'
    end
  end

  def edit
  	@camera = Camera.find(params[:id])
  end

  def update
  	camera = Camera.find(params[:id])
    if camera.update(camera_params)
      redirect_to cameras_path
    else
      render 'edit'
    end
  end

  def destroy
    camera = Camera.find(params[:id])
    camera.destroy
    redirect_to cameras_path
  end

  private

  def camera_params
  params.require(:camera).permit(:user_id, :manufacturer, :modelname)
  end

  def corrent_user
    @camera = Camera.find(params[:id])
    redirect_to cameras_path unless @camera.user_id == current_user.id
  end

end
