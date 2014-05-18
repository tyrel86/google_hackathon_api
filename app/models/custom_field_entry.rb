class CustomFieldEntry < ActiveRecord::Base
	belongs_to :user
	belongs_to :custom_field
end
