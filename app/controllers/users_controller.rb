class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)

    if @user.nil?
      head :not_found
      return
    end   
  end

  def login_form
    @user = User.new
  end

  def login
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as returning user #{user.name}"
    else
      user = User.create(name: params[:name])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as new user #{user.name}"
    end
    redirect_to root_path
    return
  end

  def logout
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      unless user.nil?
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out."
        redirect_to root_path
      else
        session[:user_id] = nil
        flash[:success] = "Error: unknown user"
        redirect_to root_path
      end
    else
      flash[:error] = "You must be logged in to log out"
      redirect_to root_path 
    end
  end

  def current
    @user = User.find_by(id: session[:user_id])
    
    if @user.nil?
      flash[:error] = "You must be logged in to view this page"
      redirect_to root_path
      return
    end
    
  end

  private 

  def user_params
    return params.require(:user).permit(:name)
  end

  
end
