class CattleVariant < ApplicationRecord
  belongs_to :cattle_breed
  has_many :cattles,  dependent: :destroy

  def name
  	title 
  end
end
