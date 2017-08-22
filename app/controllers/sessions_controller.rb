class SessionsController < ApplicationController
  def create
    begin
      auth_hash = request.env['omniauth.auth']
      new_user = UsersController.new.new_with_login(auth_hash)
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.name}"
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
