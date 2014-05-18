class Api::V1::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		render json: detail_user_json(@user)
	end

	def create
		@user = User.new
		update_user_with_post_params
		if @user.save
			render json: {status: "success", user: @user}.to_json
		else
			render json: {status: "error", messages: @user.errors.messages, user: @user}
		end
	end

	def update
		@user = User.find(params[:id])
		update_user_with_post_params
		if @user.save
			render json: {status: "success", user: @user}.to_json
		else
			render json: {status: "error", messages: @user.errors.messages, user: @user}
		end
	end

	def search
		@users = User.all
		render json: users_json(@users)
	end

	private
	def update_user_with_post_params
		params.keys.select{|key| key =~ /user_/i}.each do |key|
			@user.send("#{key.gsub("user_","")}=", params[key])
		end
	end

	def users_json(users)
		result = users.inject([]) do |r,user|
			last_location = user.locations.order("created_at desc").first
			r << user_json(user,last_location)
		end
		result.to_json
	end

	def user_json(user, last_location)
		base_hash = {
			id: user.id,
			type: user.type,
			first_name: user.first_name,
			last_name: user.last_name,
			photo_url: user.photo_url,
			email: user.email,
			phone: (user.cell_phone or user.home_phone or user.work_phone or user.relatives_phone or user.alternate_phone)
		}
		if last_location
			base_hash[:last_lat] = last_location.lat
			base_hash[:last_lng] = last_location.lng
		end

		base_hash[:vendor_statuses] = []
		statuses = UserVendorStatus.where(user_id: user.id)
		Vendor.all.each do |vendor|
			status = statuses.find_by(vendor_id: vendor.id)
			is_complete = status ? status.is_complete : false
			base_hash[:vendor_statuses] << {name: vendor.name, is_complete: is_complete}
		end

		base_hash
	end

	def detail_user_json(user)
		base_hash = user.attributes

		base_hash[:custom_attrs] = []
		user.custom_field_entries.each do |entry|
			base_hash[:custom_attrs] << {name: entry.custom_field.name, value: entry.value_text}
		end

		last_location = user.locations.order("created_at desc").first
		if last_location
			base_hash[:last_lat] = last_location.lat
			base_hash[:last_lng] = last_location.lng
		end

		base_hash[:vendor_statuses] = []
		statuses = UserVendorStatus.where(user_id: user.id)
		Vendor.all.each do |vendor|
			status = statuses.find_by(vendor_id: vendor.id)
			is_complete = status ? status.is_complete : false
			base_hash[:vendor_statuses] << {name: vendor.name, is_complete: is_complete}
		end

		base_hash.to_json
	end
end
