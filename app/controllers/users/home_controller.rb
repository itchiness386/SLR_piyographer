class Users::HomeController < ApplicationController

  def top
  end

  def about
  end

  def glossary
  end

  def ranking
    @pv_ranks = User.order('impressions_count DESC').take(5)
    @favo_ranks = Photo.find(Favorite.group(:photo_id).order('count(photo_id) desc').limit(5).pluck(:photo_id))
  end

end
