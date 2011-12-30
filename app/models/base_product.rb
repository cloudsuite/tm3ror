class BaseProduct < ActiveRecord::Base
   has_many :products # e.g., products with specific size and color
   belongs_to :category
end
