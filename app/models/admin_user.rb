class AdminUser < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable#, :confirmable
    has_many :categories
    has_many :cattle_categories
end
