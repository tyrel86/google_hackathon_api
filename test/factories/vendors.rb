FactoryGirl.define do
  factory :vendor do
		name {Faker::Company::name}
		description {Faker::Lorem::paragraph}
		image_url {"http://lorempixel.com/700/700"}
	end
end
