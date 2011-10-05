class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessor :first_name
  attr_accessor :last_name


  def first_name=(value)
    self.username = value
  end

  def last_name=(value)
    self.username += " "
    self.username += value
  end

end
