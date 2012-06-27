class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_path
    "/auth/facebook"
  end
  helper_method :login_path
end
