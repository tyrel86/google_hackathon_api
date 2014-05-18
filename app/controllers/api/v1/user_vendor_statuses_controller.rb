class Api::V1::UserVendorStatusesController < ApplicationController
	def create
		@vendor = Vendor.find(params[:vendor_id])
		@user = User.find(params[:user_id])
		@relation = UserVendorStatus.new( vendor_id: @vendor.id, user_id: @user.id, is_complete: true )
		if @relation.save
			render json: {status: "success"}
		else
			render json: {status: "error", messages: @relation.errors.messages}
		end
	end
	def update
		@relation = UserVendorStatus.find(params[:id])
		@relation.is_complete = params[:user_vendor_status].is_complete?
		if @relation.save
			render json: {status: "success"}
		else
			render json: {status: "error", messages: @relation.errors.messages}
		end
	end
end
