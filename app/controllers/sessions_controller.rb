class SessionsController < ApplicationController
  def create
    # render text: request.env['omniauth.auth'].to_json
    begin
      auth_hash = request.env['omniauth.auth']
      @user = RSpotify::User.new(auth_hash)
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.display_name}"
    rescue
      flash[:warning] = "There was an error"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "You are signed out!"
    end
    redirect_to root_path
    end



end
