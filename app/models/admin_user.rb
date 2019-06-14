class AdminUser < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable#, :confirmable
    has_many :users ,  dependent: :destroy
    has_many :cattles,  dependent: :destroy
    has_many :categories,  dependent: :destroy
    has_many :cattle_categories,  dependent: :destroy
end
