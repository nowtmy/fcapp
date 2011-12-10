class AddPermissionToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :permission, :string
  end

  def self.down
    remove_column :users, :permission
  end
end
