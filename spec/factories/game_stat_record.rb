FactoryBot.define do
  factory :game_stat_record do
    game_stat
    coefficient
    value { Faker::Number.non_zero_digit }
  end
end
