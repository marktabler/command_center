
class ReportsController < ApplicationController

  before_filter :login_required, except: :create

  def index
    @reports = current_user.reports
  end

  def show
    @report = current_user.reports.find(params[:id])
    @alerts = @report.alerts
  end

  def create
    if params[:pw] == INTERNAL_PASSWORD
      User.generate_reports
      return render nothing: true, status: 200
    else
      return render nothing: true, status: 403
    end
  end
end
