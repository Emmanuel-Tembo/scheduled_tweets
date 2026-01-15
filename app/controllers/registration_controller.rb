class RegistrationController < ApplicationController
  def new
    # withiout the @ sign a variable goes from a instance variable to a local one and what that means is that it goes from being "globally accecable to only loccally accecible inside this method"
    @user = User.new
  end
end