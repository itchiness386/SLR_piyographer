class Users::HomeController < ApplicationController

  before_action :authenticate_user!, only: [:glossary, :ranking]

  def top
  end

  def about
  end

  def glossary
  end

  def ranking
    @pv_ranks = User.where(status: true).order('impressions_count desc').take(5)
    @favo_ranks = Photo.find(Favorite.group(:photo_id).order('count(photo_id) desc').limit(5).pluck(:photo_id))
  end

end
