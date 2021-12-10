FactoryBot.define do
  factory :customer do
    first_name { Faker::Company.name }
    last_name { Faker::Company.name }
  end
end
