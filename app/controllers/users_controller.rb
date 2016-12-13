class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.receive_email=true

  if @user.save
    redirect_to root_path, notice: "Se agrego exitosamente."
  else
    render :new
  end
end

def edit
  @user = current_user
end

def update
  @user = current_user

  if @user.update_attributes(user_params)
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
