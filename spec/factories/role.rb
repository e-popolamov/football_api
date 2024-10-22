FactoryBot.define do
  factory :role do
    name { Faker::Sports::Football.position }
  end
end
