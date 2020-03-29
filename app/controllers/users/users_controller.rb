class Users::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :corrent_user, only: [:edit, :update]
  before_action :deleted_user

  def show
    @user = User.find(params[:id])
    impressionist(@user, nil)
    @photos = Photo.where(user_id: @user.id, status: true).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "ユーザ情報を変更しました"
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

  def corrent_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end

  def deleted_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user.status == true
  end

end
