class PasswordController < ApplicationController 
  before_action :require_user_logged_in!
  def edit 
 
  end 
  def update  
   if Current.user.update(password_params)
      redirect_to root_path, notice: "Password updated"
   else
      render :edit
   end 
  end 
    private 
   def password_params
      password.require(:user).required(:password, :password_confirmation)
   end 
end 