module ReportsHelper

  def report_date(report)
    report.created_at.strftime("%A, %b %-d")
  end
end
