source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

gem "bootsnap", ">= 1.1.0", require: false
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "rack-cors"
gem "rails", "~> 5.2.0"
gem "webpacker"

# 定数管理
gem "enumerize"
gem "global"

# ログイン
gem "devise"
gem "devise-i18n"
# サポート
gem "active_model_serializers", "~> 0.10.0"
gem "foreman"

# エラーキャッチ
gem "sentry-raven"

group :development, :test do
  gem "pry-byebug"
end

group :test do
  gem "database_cleaner", "~> 1.7.0"
  gem "factory_bot_rails", "~> 4.10.0"
  gem "faker", "~> 1.9.1"
  gem "rspec-rails", "~> 3.7"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "onkcop", require: false
  gem "pre-commit", require: false
  gem "seed-fu", "~> 2.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # capistrano
  gem "capistrano"
  gem "capistrano-bundler"
  gem "capistrano-rails"
  gem "capistrano-rbenv"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
