FactoryBot.define do
  factory :game do
    date { Faker::Date.backward(days: 14) }
    result { Faker::Number.between(from: 0, to: 1) }
    coefficient { Faker::Number.decimal(l_digits: 2) }
    association :win_team, factory: :team
    association :second_team, factory: :team
  end
end
