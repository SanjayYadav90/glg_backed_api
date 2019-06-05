class ServiseState < ApplicationRecord
  belongs_to :admin_user
  has_many :prices
end
