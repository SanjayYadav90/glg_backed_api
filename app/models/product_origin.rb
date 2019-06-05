class ProductOrigin < ApplicationRecord
  belongs_to :category
  has_many :cream_levels
end
