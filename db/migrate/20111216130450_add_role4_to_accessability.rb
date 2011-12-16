class AddRole4ToAccessability < ActiveRecord::Migration
  def self.up
    add_column :accessabilities, :role_4, :boolean
  end

  def self.down
    remove_column :accessabilities, :role_4
  end
end
