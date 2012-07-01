
class UsersController < ApplicationController

  def generate_reports
    if params[:pw] == INTERNAL_PASSWORD
      User.all.each do |user|
        user.generate_report
      end
    else
      return render nothing: true, status: 403
    end
  end
end
