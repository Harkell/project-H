class UsersController < ApplicationController  
  before_action :user_params, only: [:create]

  def new
    @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have signed up successfully."
      flash[:color]= "valid"
      redirect_to root_path
    else
      flash[:notice] = "One or more fields were entered incorrectly."
      flash[:color]= "invalid"
      redirect_to new_user_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :admin)
  end

end