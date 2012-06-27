
class SessionsController < ApplicationController
  def create
    u = request.env['omniauth.auth']
    User.find_or_create_by_uid(uid: u["uid"],
                               first_name: u["first_name"],
                               last_name: u["last_name"],
                               email: u["email"])
  end  

  def destroy
    request.env['omniauth.auth'] = {}
    return redirect_to root_path
  end

  def show

  end
end
