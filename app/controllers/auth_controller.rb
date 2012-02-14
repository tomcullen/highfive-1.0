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
        pin = params[:oauth_verifier]
        atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
        session[:atoken] = atoken
        session[:asecret] = asecret
      else
        client.authorize_from_access(session[:atoken], session[:asecret])
        end
      if logged_in?
        current_user.update_attributes(atoken: session[:atoken], asecret: session[:asecret])
        redirect_to contacts_url
      elsif (user = User.find_by_atoken(session[:atoken])) && user.asecret == session[:asecret]
        session[:user_id] = user.id
        redirect_to contacts_url
      else
        first_name = client.profile.first_name
        last_name = client.profile.last_name
        @user = User.new(firstname: first_name, lastname: last_name, password: "temporary", password_confirmation: "temporary", email: "your@email.com", asecret: session[:asecret], atoken: session[:atoken])
        if @user.save
          session[:user_id] = @user.id
          redirect_to populate_url
        else
          render :new
        end
      end

    end

end
