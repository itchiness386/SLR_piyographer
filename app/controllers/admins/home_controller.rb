class Admins::HomeController < ApplicationController

  before_action :authenticate_admin!

  def top
    @users = User.where(created_at: Date.today.all_day)
    @users_count = User.where(created_at: Date.today.all_day).count
    @photos = Photo.where(created_at: Date.today.all_day)
    @photos_count = Photo.where(created_at: Date.today.all_day).count
  end

end
