class Product < ApplicationRecord
  belongs_to :cream_level
  has_many :product_variants
  has_many :prices
end
