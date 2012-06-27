class Instruction < ActiveRecord::Base
  attr_accessible :ferret_type, :params, :last_run, :user_id

  serialize :params, JSON
end
