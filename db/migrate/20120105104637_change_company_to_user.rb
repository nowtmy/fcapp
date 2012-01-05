class ChangeCompanyToUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :company, :company_name
  end

  def self.down
    rename_column :users, :company_name, :company
  end
end
