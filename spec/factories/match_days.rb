FactoryGirl.define do
  factory :match_day do
    day { Faker::Date.between(10.years.ago, 10.years.from_now)}
  end
end
