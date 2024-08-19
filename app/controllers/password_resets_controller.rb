class PasswordResetsController < ApplicationController 
	def new 

	end 
	def create
	    @user = User.find_by(email: params[:email])
	    if @user
	      @user.generate_password_reset_token!
	      PasswordMailer.with(user: @user).reset.deliver_now
	      redirect_to root_path, notice: "Check your email for password reset instructions."
	    else
	      flash[:alert] = "Email not found"
	      render :new
	    end
	end
	    # redirect_to root_path, notice: "your password is reset"
	def edit
	    @user = User.find_by(reset_password_token: params[:token])
	    if @user&.password_reset_token_valid?
	      # Token is valid; proceed to reset password
	    else
	      redirect_to sign_in_path, alert: "The token has expired or is invalid."
	    end
	end
	def update
	    @user = User.find_by(reset_password_token: params[:token])
	    if @user&.password_reset_token_valid?
		    if @user.update(user_params)
		       @user.invalidate_password_reset_token!
		       redirect_to sign_in_path, notice: "Your password has been reset successfully."
		    else
		       render :edit
		    end
	    else
	      redirect_to sign_in_path, alert: "The token has expired or is invalid."
	    end
    end
       private 
        def user_params
          params.require(:user).permit(:password, :password_confirmation)
        end
end 