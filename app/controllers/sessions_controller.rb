class SessionsController < ApplicationController
  before_filter :redirect_if_signed_in?, only: [:new, :create]
  def new

  end

  def create

    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to contacts_url, notice: "Welcome #{user.firstname}!"
    else
      redirect_to sessions_new_url, notice: "Login error. Please try again."
    end
  end

  def destroy
    reset_session
    # current_user = nil
    redirect_to sessions_new_url, notice: "You have logged out"
  end
  


end
# current_user = nil
