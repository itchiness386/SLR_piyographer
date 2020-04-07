class Admins::SearchsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @user_keyword = params[:q][:name_cont]
    @camera_keyword = params[:q][:camera_cont]
    @tag_keyword = params[:q][:tags_name_cont]
  end

end
