class PasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  # def reset
  #   # @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)
  #   # mail to: params[:user].email
  #    @user = params[:user]
  #   @token = params[:token]
  #   mail(to: @user.email, subject: "Reset Your Password")
  # end
  def reset
    @user = params[:user]
    @token = @user.reset_password_token
    mail(to: @user.email, subject: "Password Reset Instructions")
  end
end
