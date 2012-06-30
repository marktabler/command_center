class Alert < ActiveRecord::Base
  attr_accessible :body, :instruction_id, :published, :report_id
  belongs_to :report
  belongs_to :instruction

  def self.unpublished
    where report_id: nil
  end

end
