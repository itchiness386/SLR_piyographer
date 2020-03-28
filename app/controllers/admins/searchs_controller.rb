class Admins::SearchsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @keyword = params[:q][:name_cont]
  end

end
