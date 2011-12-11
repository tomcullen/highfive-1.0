class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to contacts_url, notice: "Welcome !"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to sessions_new_url, notice: "You have logged out"
  end

end
