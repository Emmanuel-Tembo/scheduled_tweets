class MainController < ApplicationController
  # the .now only displays on current request
  def index
    if session[:user_id]
      # this looks up for the user and makes it available to the main controllers attributes
      # use find_by instead of just find to avoid tedios errors/ crashing when user cannot be found
      @user = User.find_by(id: session[:user_id])
    end
  end
end