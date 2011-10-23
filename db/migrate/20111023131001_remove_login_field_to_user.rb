class RemoveLoginFieldToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :login, :string, :null => true
  end

  def self.down
  end
end
