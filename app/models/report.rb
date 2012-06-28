class Report < ActiveRecord::Base
  attr_accessible :body, :sent_at, :subject, :user_id
  belongs_to :user

  def published?
    !sent_at
  end

end
