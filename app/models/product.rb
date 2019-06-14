class Product < ApplicationRecord
  belongs_to :cream_level
  has_many :product_variants, dependent: :destroy
  has_many :prices, dependent: :destroy
end
