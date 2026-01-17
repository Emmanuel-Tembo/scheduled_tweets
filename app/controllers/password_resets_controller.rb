class PasswordResetsController < ApplicationController
  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present? 
      #Send email
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "If an account was found, a reset link has been sent to your email"
    else
      redirect_to root_path, notice: "If user was founn, reset link has been sent to email"
    end
  end
end