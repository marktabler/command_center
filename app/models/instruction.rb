class Instruction < ActiveRecord::Base
  attr_accessible :ferret_type, :params, :last_run, :user_id

  belongs_to :user
  has_many :alerts

  serialize :params, JSON

  def self.runnable
    where "last_run < ?", DateTime.now - 23.hours
  end

  # Only one unpublished alert per instruction at a time. This prevents
  # double-reporting if an algorithm gathers data twice in a given period.
  def create_alert(body)
    unless alerts.unpublished.any?
      alerts.create(body: body)
    end
  end
end
