class ApplicationController < ActionController::Base

  before_action :set_search

  def set_search
    @user_search = User.ransack(params[:q])
    @user_search_results = @user_search.result(distinct: true)
    @photo_search = Photo.ransack(params[:q])
    @photo_search_results = @photo_search.result(distinct: true).includes(:tags)
  end

  private

  # サインイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_root_path
    else
      root_path
    end
  end

  # サインアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

end
