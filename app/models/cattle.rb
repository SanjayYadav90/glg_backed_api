class Cattle < ApplicationRecord
  belongs_to :admin_user
  belongs_to :cattle_category
  belongs_to :cattle_breed
  belongs_to :cattle_variant
end
