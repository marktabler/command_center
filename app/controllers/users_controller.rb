
class UsersController < ApplicationController
  before_filter :login_required, only: :destroy
  def generate_reports
    if params[:pw] == INTERNAL_PASSWORD
      User.all.each do |user|
        user.generate_report
      end
    else
      return render nothing: true, status: 403
    end
  end

  def destroy
    current_user.reports.destroy_all
    current_user.alerts.destroy_all
    current_user.instructions.destroy_all
    current_user.destroy
    session["uid"] = nil
    return redirect_to root_path
  end
end
