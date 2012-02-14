class AuthController < ApplicationController
  def index
    client = LinkedIn::Client.new("54biq7g6ggjo", "hPbyUdevmHxqvGup")
    request_token = client.request_token(:oauth_callback => 
                                      "http://#{request.host_with_port}/auth/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url
  end
  
  def callback
      client = LinkedIn::Client.new("54biq7g6ggjo", "hPbyUdevmHxqvGup")
      if session[:atoken].nil?
        p "1"
        pin = params[:oauth_verifier]
        atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
        session[:atoken] = atoken
        session[:asecret] = asecret
      else
        p "2"
        client.authorize_from_access(session[:atoken], session[:asecret])
      end
      if logged_in?
        p "3"
        current_user.update_attributes(atoken: session[:atoken], asecret: session[:asecret])
        redirect_to contacts_url
      elsif (user = User.find_by_atoken(session[:atoken])) && user.asecret == session[:asecret]
        p "4"
        session[:user_id] = user.id
        redirect_to contacts_url
      else
        p "5"
        first_name = client.profile.first_name
        last_name = client.profile.last_name
        @user = User.new(firstname: first_name, lastname: last_name, password: "temporary", password_confirmation: "temporary", email: "your@email.com", asecret: session[:asecret], atoken: session[:atoken])
        if @user.save
          p "6"
          session[:user_id] = @user.id
          redirect_to populate_url
        else
          p @user.errors
          p "7"
          render :new
        end
      end

    end

end
