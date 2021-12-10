FactoryBot.define do
  factory :invoice do
    status { Faker::Coffee.blend_name}
  end
end
