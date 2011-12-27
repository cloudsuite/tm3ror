class Manufacturer < ActiveRecord::Base
   has_many :product_lines
end
