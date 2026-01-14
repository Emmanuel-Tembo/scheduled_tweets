class MainController < ApplicationController
  # the .now only displays on current request
  def index
    flash.now[:notice] = "Logged in successfully"
    flash.now[:alert] = "Invalid email or password"
  end
end