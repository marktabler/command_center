class Alert < ActiveRecord::Base
  attr_accessible :body, :instruction_id
  belongs_to :report
  belongs_to :user

  def self.unpublished
    where report_id: nil
  end

  def published?
    !!report_id
  end
end
