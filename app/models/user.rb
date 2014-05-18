class User < ActiveRecord::Base
	has_many :locations
	has_many :custom_field_entries

	def type
		if is_admin
			"admin"
		elsif is_volunteer
			"volunteer"
		else
			"survivor"
		end
	end
end
