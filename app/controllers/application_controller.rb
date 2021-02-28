class ApplicationController < ActionController::Base
  add_flash_types :success, :warning, :danger
  helper_method :current_user
  helper_method :login_required
  include Pagy::Backend

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_url unless current_user
  end
end
