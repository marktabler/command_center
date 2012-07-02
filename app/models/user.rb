class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :uid

  has_many :reports
  has_many :instructions

  def self.generate_reports
    all.each do |user|
      user.generate_report rescue puts "Error generating report for #{user.id}"
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def latest_report
    reports.order("sent_at DESC").first
  end

  def alerts
    Alert.where("instruction_id in(?)", instructions.pluck(:id))
  end

  def unpublished_alerts
    alerts.unpublished
  end

  def generate_report
    if unpublished_alerts.any?
      Report.build_for_user(self)
    end
  end
end
