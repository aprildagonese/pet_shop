class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash[:welcome] = "Welcome #{@user.username}!"
    else
      redirect_to new_user_path
      flash[:error] = "Your account could not be created."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password_digest)
  end
end
