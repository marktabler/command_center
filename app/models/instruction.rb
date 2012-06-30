class Instruction < ActiveRecord::Base
  attr_accessible :ferret_type, :params, :last_run, :user_id

  belongs_to :user
  
  serialize :params, JSON

  def self.runnable
    where "last_run < ?", DateTime.now - 4.hours
  end
end
