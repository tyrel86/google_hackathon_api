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

  def text(body)
    account_sid = 'ACbc30a74e5c10d944534885bd2c8e7b22' 
    auth_token = '312c991c2e59bd207396021142ec6b99' 

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create({
      :from => '+17204416629',
      :to => cell_phone,
      :body => body
    })
  end
end
