class ApplicationController < ActionController::Base
  # before actions run before every other action gets processed
  before_action :set_currrent_user
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  
  def set_currrent_user
    if session[:user_id]
      # this looks up for the user and makes it available to the main controllers attributes
      # use find_by instead of just find to avoid tedios errors/ crashing when user cannot be found
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "Sign in to continue" if Current.user.nil?
  end
end
