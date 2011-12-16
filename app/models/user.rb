class User < ActiveRecord::Base
  acts_as_authentic do |d|
    d.validate_login_field(false)
  end
  acts_as_authentic do |c|
    c.login_field = :email
  end

  has_one :role
  has_one :accreditation
  has_many :contacts
  has_one :company
  has_one :accessability
  has_attached_file :profile, :styles => { :small => "184x102>" }


  attr_accessor :first_name
  attr_accessor :last_name

  attr_accessor :account_master
  attr_accessor :qualified_supervisor
  attr_accessor :electrician
  attr_accessor :administrator


  has_many :fellowers, :class_name => "User", :foreign_key => 'parent_id'

  def first_name=(value)
    self.username = value
  end

  def last_name=(value)
    self.username += " "
    self.username += value
  end

  def first_name
    if !self.username.nil?
      self.username.split(' ')[0]
    else
      ""
    end
  end

  def last_name
    if !self.username.nil?
      self.username.split(' ')[1]
    else
      ""
    end
  end

  def accessability_type
    array = []
    if accessability.role_1?
      array.push "Account Master"
    end
    if accessability.role_2?
      array.push "Qualified Supervisor"
    end
    if self.accessability.role_3?
      array.push "Electrician"
    end
    if self.accessability.role_4?
      array.push "Administrator"
    end
    array.join(',')
  end

  def account_master
      if !self.accessability.nil?
        self.accessability.role_1?
      end
  end

  def qualified_supervisor
      if !self.accessability.nil?
        self.accessability.role_2?
      end
  end
  def electrician
      if !self.accessability.nil?
        self.accessability.role_3?
      end
  end

  def administrator
      if !self.accessability.nil?
        self.accessability.role_4?
      end
  end

  private

  def self.login_by_email(login)
    find_by_email(login)
  end

end
