class User < ApplicationRecord
	has_secure_password
	# GENDER = ["Male", "Female"]
	# USER_STATUS = ["Active", "Inactive"]
	belongs_to :admin_user
	belongs_to :service_state
end
