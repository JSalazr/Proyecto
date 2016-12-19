class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    authenticate_logeado

    email = params[:session][:email]
    password = params[:session][:password]

    @user = User.find_by(email: email)

    if @user && @user.authenticate(password)
      login(@user)
    else
      redirect_to dashboard_path, flash: { error: "Email o Password incorrecto"}
    end
  end

  def show
    @current_user = current_user
  end

  def destroy
    if current_user
      logout
    else
      redirect_to login_path
    end
  end
  
end
