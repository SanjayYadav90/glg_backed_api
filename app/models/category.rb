class Category < ApplicationRecord
  belongs_to :admin_user
  has_many :product_origins, dependent: :destroy 
end
