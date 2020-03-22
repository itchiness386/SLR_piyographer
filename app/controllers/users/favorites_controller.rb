class Users::FavoritesController < ApplicationController

  def create
    photo = Photo.find(params[:photo_id])
    favorite = Favorite.new(photo_id: photo.id)
    favorite.user_id = current_user.id
    favorite.save
    redirect_to photo_path(photo)
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    favorite = Favorite.find_by(photo_id: photo.id, user_id: current_user.id)
    favorite.destroy
    redirect_to photo_path(photo)
  end

end
