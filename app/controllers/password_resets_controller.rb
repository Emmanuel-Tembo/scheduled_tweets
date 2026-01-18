class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present? 
      #Send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
      redirect_to root_path, notice: "If user was found, reset link has been sent to email"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Youur token has expired please Try again"
  end

  def update
    # In order to actually update the proper user password the user needs to be logged in for it to work
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your Password was reset successfully'
    else
      render :edit
    end

  end
    #  In Ruby/Rails, the private keyword and methods need to be defined at the class level, not inside another method.
    private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end