class CreateUsers < ActiveRecord::Migration
  def self.up
     drop_table :users
    create_table :users do |t|
       
           t.string  "first_name"
           t.string   "last_name"
           t.string   "email_address"
           t.string   "phone_number"
           t.integer   "wants_n_catelogs"
           t.timestamps

    end
  end

  def self.down
    drop_table :users
  end
end
