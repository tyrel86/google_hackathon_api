class Api::V1::VendorsController < ApplicationController
	def index
		@vendors = Vendor.all
		render json: @vendors.to_json
	end
end
