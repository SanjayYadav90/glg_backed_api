class CattleVariant < ApplicationRecord
  belongs_to :cattle_breed
  has_many :cattles
end
