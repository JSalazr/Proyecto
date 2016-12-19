class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticate
  before_action :authenticate


  def login(user)
  	session[:user_id] = user.id
  	redirect_to dashboard_path
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

  def authenticate_logeado
    if current_user
      redirect_to dashboard_path
    end
  end

  def authenticate
    unless current_user
      redirect_to login_path
    end
  end


end
