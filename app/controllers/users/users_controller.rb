class Users::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(user_id: @user.id).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user)
    else
      render 'edit'
    end
  end

  def confirm
    @user = User.find(current_user.id)
  end

  def delete
  	user = User.find(current_user.id)
    user.status = false
    user.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image, :introduction, :status)
  end

end
