class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def require_user
    if !session[:user_id].present?
      redirect_to sessions_new_url, :notice => "Please Sign in to HIGH FIVE first!"
      # return true
    end
    # return false
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    # User.find(session[:user_id])
  end


  def logged_in?
    current_user != nil
  end
  
  def redirect_if_signed_in?
    if logged_in?
      redirect_to events_url
    end
  end


end
