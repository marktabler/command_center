class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :uid

  has_many :reports
  has_many :instructions
  has_many :alerts

  def name
    "#{first_name} #{last_name}"
  end

  def latest_report
    reports.order("sent_at DESC").first
  end

  def make_report
    if alerts.unpublished.any?
      reports.build_with_alerts(alerts.unpublished)
    end
  end

  def make_and_send_report
    report = make_report
    report.send_email if report
  end
end
