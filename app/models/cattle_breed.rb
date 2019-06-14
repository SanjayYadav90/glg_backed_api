class CattleBreed < ApplicationRecord
  belongs_to :cattle_category
  has_many :cattle_variants,  dependent: :destroy
end
