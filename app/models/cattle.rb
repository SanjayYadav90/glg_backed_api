class Cattle < ApplicationRecord
  belongs_to :admin_user
  belongs_to :cattle_variant
  has_one :cattle_current_status,  dependent: :destroy

  has_many :cattles, :class_name => "Cattle",
    :foreign_key => "parent_cattle_id"
  belongs_to :parent_cattle, :class_name => "Cattle",
    :foreign_key => "parent_cattle_id"

end
