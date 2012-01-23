class InterestedsController < ApplicationController
layout nil

  def new
    @interested = Interested.new
  end
  
  def create
    @interested = Interested.new(params[:interested])
    
    if @interested.save
    redirect_to root_url, notice: "Thanks for Signing Up!"
  else
    redirect_to root_url
  end
  end

end
