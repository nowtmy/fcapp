class AddAccreditationIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :accreditation_id, :integer
  end

  def self.down
    remove_column :users, :accreditation_id
  end
end
