class UsersController < ApplicationController
  def login_form
    @user = User.new
  end

  def login
    name = params[:user][:name]
    user = User.find_by(name: name)
    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{user.name}"
    else
      user = User.create(name: name)
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{user.name}"
    end
    redirect_to root_path
    return
  end
end
