class Report < ActiveRecord::Base
  attr_accessible :body, :sent_at, :subject, :user_id
end
