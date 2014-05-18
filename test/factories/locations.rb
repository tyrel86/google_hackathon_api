FactoryGirl.define do
  factory :location do
		lat {("#{(38..40).to_a.sample}.#{(0..99).to_a.sample}").to_f}
		lng {("#{((-106)..(-104)).to_a.sample}.#{(0..99).to_a.sample}").to_f}
	end
end
