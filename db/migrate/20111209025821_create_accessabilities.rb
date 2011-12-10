class CreateAccessabilities < ActiveRecord::Migration
  def self.up
    create_table :accessabilities do |t|
      t.boolean :role_1
      t.boolean :role_2
      t.boolean :role_3

      t.timestamps
    end
  end

  def self.down
    drop_table :accessabilities
  end
end
