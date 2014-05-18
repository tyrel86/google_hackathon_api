FactoryGirl.define do
  factory :user do
		is_admin { rand(2) % 2 == 0 }
		is_volunteer { not is_admin and rand(2) & 2 == 0 }
		is_survivor do
			if not is_admin and not is_volunteer
				true
			else
				false
			end
		end
		first_name { Faker::Name::first_name }
		last_name { Faker::Name::last_name }
		physical_street_1 { Faker::Address::street_address }
		physical_city { Faker::Address::city }
		physical_state { Faker::Address::state }
		physical_zipcode { Faker::Address::zip_code }
		mailing_street_1 { Faker::Address::street_address }
		mailing_city { Faker::Address::city }
		mailing_state { Faker::Address::state }
		mailing_zipcode { Faker::Address::zip_code }
		current_street_1 { Faker::Address::street_address }
		current_city { Faker::Address::city }
		current_state { Faker::Address::state }
		current_zipcode { Faker::Address::zip_code }
		email { Faker::Internet::email }
		alternate_email { Faker::Internet::email }
		cell_phone { Faker::PhoneNumber::phone_number.split(" ").first }
		home_phone { Faker::PhoneNumber::phone_number.split(" ").first }
		work_phone { Faker::PhoneNumber::phone_number.split(" ").first }
		relatives_phone { Faker::PhoneNumber::phone_number.split(" ").first }
		alternate_phone { Faker::PhoneNumber::phone_number.split(" ").first }
		damage_level { DAMAGE_LEVELS.sample }
		living_situation { LIVING_SITUATIONS.sample }
		type_of_dwelling { DWELLING_TYPES.sample }
		insurance_status { INSURANCE_TYPES.sample }
		type_of_business_insurance { Faker::Lorem::words(3).join(" ") }
		name_of_business { Faker::Company::name }
		food_concerns { Faker::Lorem::paragraph }
		housing_concerns { Faker::Lorem::paragraph }
		health_concerns { Faker::Lorem::paragraph }
		medicine_concerns { Faker::Lorem::paragraph }
		employment_concerns { Faker::Lorem::paragraph }
		building_structure_concerns { Faker::Lorem::paragraph }
		transporation_concerns { Faker::Lorem::paragraph }
		financial_concerns { Faker::Lorem::paragraph }
		clean_up_concerns { Faker::Lorem::paragraph }
		has_unemployment_insurance { rand(2) % 2 == 0 }
		has_pets { rand(2) % 2 == 0 }
		has_service_animal { rand(2) % 2 == 0 }
		other_concerns { Faker::Lorem::paragraph }
  end
end
