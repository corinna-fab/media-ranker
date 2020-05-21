class ApplicationController < ActionController::Base

  def current_user
    return @current_user = User.find_by(id: session[:user_id])
  end

  def require_login
    if @current_user.nil?
      flash[:error] = "Sorry, you must be logged in to upvote a pizza."
      redirect_to root_path
      return
    end
  end

end
