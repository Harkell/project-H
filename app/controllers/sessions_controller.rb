class SessionsController < ApplicationController
  before_filter :save_login_state, :only => [:login, :login_attempt]
  before_filter :authenticate_user, :only => [:login]

  def login
    #The Login Form
  end



  def login_attempt
    authorized_user = User.authenticate(params[:username], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Logged in as #{authorized_user.username}."
      redirect_to root_path
    else
      flash[:notice] = "Invalid Username or Password."
      flash[:color]= "invalid"
      #redirect_to sessions_login_path
      render 'login' 
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You have successfully logged out."
  end



end