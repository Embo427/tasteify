class UsersController < ApplicationController
  def index
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

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :image, :playlist_count)
  end

  def get_user
    User.find(params[:id])
  end

end
