class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def login(user)
  	session[:user_id] = user.id
  	redirect_to root_path
  end

  def logout
  	reset_session
  	redirect_to root_path
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
