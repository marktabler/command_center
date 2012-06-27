class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_path
    "/auth/facebook"
  end
  helper_method :login_path

  def current_user
    User.find_by_uid(request.env['omniauth.auth']["uid"]) rescue nil
  end
  helper_method :current_user
end
