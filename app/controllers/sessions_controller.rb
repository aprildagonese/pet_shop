class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome, #{user.username}!"
    else
      flash[:alert] = "We couldn't find you with those logins. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:alert] = "You have been logged out."
    redirect_to root_path
  end
end
