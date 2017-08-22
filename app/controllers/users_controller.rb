class UsersController < ApplicationController
  def index
    current_user = User.find_by_id(session[:user_id])
    @users = User.all
  end

  def show
    @user = get_user
  end

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
     redirect_to users_path
   else
     render 'new' #render page again and tell user what's wrong
   end
  end

  def new_with_login(auth_hash)
    @spotify_user = RSpotify::User.new(auth_hash)
    find_or_create(@spotify_user)
  end

  def find_or_create(user_details)
    new_user = User.find_or_create_by(username: user_details.id)
    #add some logic to check for changed fields
    new_user.update({name: user_details.display_name,
     email_address: user_details.email})
    new_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :image, :playlist_count)
  end

  def get_user
    User.find(params[:id])
  end
end
