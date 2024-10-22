FactoryBot.define do
  factory :coefficient do
    name { Faker::Name.name }
    value { Faker::Number.between(from: 0.0, to: 3.0) }
    role
  end
end
