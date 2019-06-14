class ServiceState < ApplicationRecord
  belongs_to :admin_user
  has_many :prices, dependent: :destroy
  has_many :users, dependent: :destroy
end
