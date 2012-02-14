class UsersController < ApplicationController
  
  def new_career
    @user_career_join = UserCareerJoin.new
    @user = current_user
  end
  
  def create_career
    @user_career_join = UserCareerJoin.new(params[:user_career_join])
    @user_career_join.user = current_user
    @user_career_join.save
    current_user.update_attributes(location: params[:location])
    redirect_to user_url(current_user)
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
