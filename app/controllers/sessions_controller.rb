class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
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
    logout
  end
end
