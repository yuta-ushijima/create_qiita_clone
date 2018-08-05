source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails', '~> 5.2.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'webpacker'
gem 'bootsnap', '>= 1.1.0', require: false

# 定数管理
gem 'global'
gem 'enumerize'

# ログイン
gem 'devise'
gem 'devise-i18n'
# サポート
gem 'foreman'
gem 'active_model_serializers', '~> 0.10.0'

group :test do
  gem "database_cleaner", "~> 1.7.0"
  gem "factory_bot_rails", "~> 4.10.0"
  gem "faker", "~> 1.9.1"
  gem "rspec-rails", "~> 3.7"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
