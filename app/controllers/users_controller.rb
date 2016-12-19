class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  authenticate_logeado
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.receive_email=true

  if @user.save
    UserNotifierMailer.signup_email(@user).deliver
    login(@user)
    redirect_to root_path, notice: "Se agrego exitosamente."
  else
    render :new
  end
end

def edit
  @user = current_user
end

def password
  @user = current_user
end

def update
  @user = current_user

  if @user.update_attributes(user_params)
    UserNotifierMailer.password_edit(@user).deliver
    redirect_to profile_path
  else
    render :edit
  end
end

protected

def user_params
  params.require(:user).permit!
end
end
