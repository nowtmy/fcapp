class CreateAccreditation < ActiveRecord::Migration
  def self.up
    create_table :accreditations do |t|
      t.string :niceic_approved_contractor
      t.string :niceic_domestic_installer
      t.string :electrical_contractors_association
      t.string :napit
      t.string :elecsa
    end
  end

  def self.down
    drop_table :accreditations
  end
end
