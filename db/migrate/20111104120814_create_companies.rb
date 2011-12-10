class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :userid
      t.string :name
      t.string :office_telephone
      t.string :office_email_address
      t.string :website
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :city
      t.string :country
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
