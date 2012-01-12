class CreateClinics < ActiveRecord::Migration
  def self.up
    create_table :clinics do |t|
      t.string :name
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :url
      t.string :billing_email
      t.string :phone
      t.string :price_schedule

      t.timestamps
    end
  end

  def self.down
    drop_table :clinics
  end
end
