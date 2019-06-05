class Category < ApplicationRecord
  belongs_to :admin_user
  has_many :products
  has_many :product_origins
end
