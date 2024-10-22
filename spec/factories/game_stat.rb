FactoryBot.define do
  factory :game_stat do
    game
    player

    trait :with_game_stat_records do
      transient do
        game_stat_records_count { 5 }
      end

      after(:create) do |game_stat, evaluator|
        create_list(:game_stat_record, evaluator.game_stat_records_count, game_stat: game_stat, value: Faker::Number.non_zero_digit)
      end
    end
  end
end
