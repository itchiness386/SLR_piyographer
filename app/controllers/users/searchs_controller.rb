class Users::SearchsController < ApplicationController

  before_action :authenticate_user!

  def index
    @keyword = params[:q][:name_cont]
  end

end
