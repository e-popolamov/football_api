FactoryBot.define do
  factory :player do
    first_name { Faker::Sports::Football.player }
    last_name { Faker::Sports::Football.player }
    team
    role
  end
end
