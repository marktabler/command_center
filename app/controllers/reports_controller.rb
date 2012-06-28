
class ReportsController < ApplicationController

  before_filter :login_required

  def index
    @reports = current_user.reports
  end

  def show

  end
end
