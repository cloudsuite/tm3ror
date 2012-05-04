class UpdateUsers9 < ActiveRecord::Migration
  def self.up
     change_table :users do |t|
        t.index :reset_password_token
     end
  end

  def self.down
  end
end
