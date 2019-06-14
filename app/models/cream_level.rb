class CreamLevel < ApplicationRecord
	belongs_to :product_origin
	has_many :products, dependent: :destroy
end
