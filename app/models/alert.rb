class Alert < ActiveRecord::Base
  attr_accessible :body, :instruction_id, :published
end
