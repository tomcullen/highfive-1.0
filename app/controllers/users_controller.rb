class UsersController < ApplicationController
  
  def edit_profile
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user
      redirect_to contacts_url
    else
      render :new
    end
  end

  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find_by_id(current_user.id)
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to user_url(@user), notice: "You changed your profile information!"
    else
      render :edit, notice: "There was an error updating your profile"
    end
  end

end
