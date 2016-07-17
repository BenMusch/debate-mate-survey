class PasswordResetsController < ApplicationController
  before_action :valid_user, only: [:edit, :update]

  def new
  end

  def create
    user = User.find_by(email: params[:password_reset][:email].downcase)
    if user
      reset_service.begin
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Password cannot be empty"
      render 'edit'
    elsif user.update_attributes(user_params)
      log_in user
      flash[:success] = "Password has been reset."
      redirect_to user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user
    @user ||= User.find_by(email: params[:email])
  end

  def reset_service
    @reset_service ||= PasswordResetService.new(user)
  end

  def valid_user
    unless reset_service.valid?
      flash[:danger] = "Invalid reset link"
      redirect_to root_url
    end
  end
end
