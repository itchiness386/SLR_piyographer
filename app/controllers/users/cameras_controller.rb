class Users::CamerasController < ApplicationController

  def index
  	@cameras = Camera.all
  	@camera = Camera.new
  end

  def create
  	@camera = Camera.new(camera_params)
  	@camera.user_id = current_user.id
    if @camera.save
      redirect_to cameras_path
    else
      @cameras = Camera.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def camera_params
  params.require(:camera).permit(:user_id, :manufacturer, :modelname)
  end

end
