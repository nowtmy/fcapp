class AddUserIdToAccessability < ActiveRecord::Migration
  def self.up
    add_column :accessabilities, :user_id, :integer
  end

  def self.down
    remove_column :accessabilities, :user_id
  end
end
