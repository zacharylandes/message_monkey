source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'



gem 'rails', '~> 5.2.3'
gem 'pg', '~> 0.18', group: [:production]
gem 'rails_12factor', group: [:production]
gem 'jquery-rails'
gem 'faker'
gem 'factory_bot_rails'
gem 'database_cleaner'
gem 'font-awesome-rails' 
gem 'sqlite3', group: [:development, :test]
gem 'puma', '~> 3.11'
gem 'bootstrap'
gem 'bootstrap-sass'
gem 'sass-rails', '>= 3.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'pry'
  gem 'rb-readline'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end



group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
