class Report < ActiveRecord::Base
  attr_accessible :body, :sent_at, :subject, :user_id
  belongs_to :user
  has_many :alerts

  def self.build_with_alerts(alerts)
    alerts.each do |alert|
      alert.update_attribute(:report_id, id)
    end
  end

  def send_email
    update_attribute(:sent_at, DateTime.now)
  end

end
