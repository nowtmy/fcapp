class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :firstname
      t.string :secondname
      t.string :company
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :addressline1
      t.string :addressline2
      t.string :addressline3
      t.string :city
      t.string :country
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
