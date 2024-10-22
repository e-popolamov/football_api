source "https://rubygems.org"

gem "rails", "~> 7.2.1", ">= 7.2.1.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "jsonapi-serializer"
gem "kaminari"
gem "sidekiq", "~> 7.3", ">= 7.3.2"

group :development, :test do
  gem "dotenv-rails"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "rubocop-rails-omakase", require: false
  gem "faker"
  gem "factory_bot_rails", "~> 5.1", ">= 5.1.1"
  gem "rspec-rails", "~> 7.0", ">= 7.0.1"
  gem "shoulda-matchers", "~> 5.0"
  gem "simplecov"
end
