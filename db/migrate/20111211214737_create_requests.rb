class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer "type_of_request" # 1=for catelog
      t.integer "number_of_catelogs"

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
