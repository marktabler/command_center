class Notifier < ActionMailer::Base
  default from: "noreply@ferrety.net"

  def report(report)
    @alerts = report.alerts
    mail(to: report.user.email, subject: "Your Daily Ferrety Report")
  end
end
