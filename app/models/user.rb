class User < ActiveRecord::Base
  acts_as_authentic do |d| d.validate_login_field(false) end
  acts_as_authentic do |c| c.login_field = :email
  end
  attr_accessor :first_name
  attr_accessor :last_name


  def first_name=(value)
    self.username = value
  end

  def last_name=(value)
    self.username += " "
    self.username += value
  end

  private

  def self.login_by_email(login)
    find_by_email(login)
  end


end
