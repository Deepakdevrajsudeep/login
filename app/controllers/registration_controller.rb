class RegistrationController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
