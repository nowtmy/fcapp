class AddUserIdToAccreditation < ActiveRecord::Migration
  def self.up
    add_column :accreditations, :user_id, :integer
  end

  def self.down
    remove_column :accreditations, :user_id
  end
end
