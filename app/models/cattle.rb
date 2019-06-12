class Cattle < ApplicationRecord
  belongs_to :admin_user
  belongs_to :cattle_variant
  has_one :cattle_current_status
end
