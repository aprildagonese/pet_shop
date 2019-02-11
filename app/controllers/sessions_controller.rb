class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome back, #{user.name}!"
    else
      flash[:alert] = "We couldn't find you with those logins. Please try again."
      render :new
    end
  end
end
