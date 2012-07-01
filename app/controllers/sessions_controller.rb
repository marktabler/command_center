
class SessionsController < ApplicationController
  def create
    u = request.env['omniauth.auth']['extra']['raw_info']
    User.find_or_create_by_uid(uid: u["id"],
                               first_name: u["first_name"],
                               last_name: u["last_name"],
                               email: u["email"])
    session["uid"] = u["id"]
    return redirect_to 'http://ferrety.net'
  end  

  def destroy
    session["uid"] = nil
    return redirect_to root_path
  end

  def show

  end
end
