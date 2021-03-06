class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
  	@users = User.all
  end

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
      redirect_to admins_user_path(user)
      flash[:notice] = "ユーザのステータス情報を更新しました"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:status)
  end

end
