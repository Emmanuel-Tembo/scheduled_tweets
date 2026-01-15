class RegistrationController < ApplicationController
  def new
    # withiout the @ sign a variable goes from a instance variable to a local one and what that means is that it goes from being "globally accecable to only loccally accecible inside this method"
    @user = User.new
  end

  # this is the action to actually save a user to the chema
  def create
    # u need user_params to actually connnect the form data to the rewuired column inputs
    @user = User.new(user_params)

    if @user.save 
      # sessions is a safer option due to it's encryption ability
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Created successfully"

    else
      # N.B use render and not redirect for rendering error mesasges, allows u to display them dinamically
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation) 
  end
end