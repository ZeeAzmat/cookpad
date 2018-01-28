class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate_user
    unless logged_in?
      flash[:erro] = "Please log in."
      redirect_to root_path
    end
  end

  def logged_in?
   !current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
