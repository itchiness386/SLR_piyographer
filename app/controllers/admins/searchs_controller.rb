class Admins::SearchsController < ApplicationController

  def index
    @keyword = params[:q][:name_cont]
  end

end
