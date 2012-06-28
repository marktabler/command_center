
class ReportsController < ApplicationController

  before_filter :login_required

  def index
    @reports = current_user.reports
  end

  def show
    @report = current_user.reports.find(params[:id])
    @alerts = @report.alerts
  end
end
