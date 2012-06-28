class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :uid

  has_many :reports
  has_many :instructions

  def name
    "#{first_name} #{last_name}"
  end
end
