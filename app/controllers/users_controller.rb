class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def login_form
    @user = User.new
  end

  def login
    name = params[:user][:name]
    user = User.find_by(name: name)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{name}"
    else
      user = User.create(name: name)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{name}"
    end
git
    redirect_to root_path
    return
  end

  private 

  def user_params
    return params.require(:user).permit(:name)
  end
end
