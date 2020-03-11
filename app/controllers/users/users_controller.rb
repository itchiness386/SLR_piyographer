class Users::UsersController < ApplicationController

  def show
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
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image, :introduction, :status)
  end

end
