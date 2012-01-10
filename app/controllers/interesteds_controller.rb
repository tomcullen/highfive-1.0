class InterestedsController < ApplicationController
layout nil

  def new
    @interested = Interested.new
  end
  
  def create
    @interested = Interested.new(params[:interested])
    
    if @interested.save
    redirect_to new_interested_url, notice: "Thanks for Signing Up!"
  else
    render :new
  end
  end

end
