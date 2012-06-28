class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    unless current_user
      redirect_to root_path, notice: "You must be logged in to view that page."
    end
  end

  def login_path
    "/auth/facebook"
  end
  helper_method :login_path

  def current_user
    User.find_by_uid(session["uid"]) rescue nil
  end
  helper_method :current_user
end
