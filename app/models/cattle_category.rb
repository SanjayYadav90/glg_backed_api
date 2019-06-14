class CattleCategory < ApplicationRecord
	belongs_to :admin_user
	has_many :cattle_breeds,  dependent: :destroy
end
