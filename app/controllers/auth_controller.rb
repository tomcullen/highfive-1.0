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
      current_user.update_attributes(atoken: session[:atoken], asecret: session[:asecret])
      redirect_to contacts_url
    end

end
