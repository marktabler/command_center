class Report < ActiveRecord::Base
  attr_accessible :body, :sent_at, :subject, :user_id
  belongs_to :user
  has_many :alerts

  def self.build_for_user(user)
    report = Report.create(user_id: user.id)
    user.unpublished_alerts.each do |alert|
      alert.update_attribute(:report_id, report.id)
    end
    report.send_email
  end

  def send_email
    update_attribute(:sent_at, DateTime.now)
  end

end
