class Price < ApplicationRecord
  belongs_to :product
  belongs_to :servise_state
end
