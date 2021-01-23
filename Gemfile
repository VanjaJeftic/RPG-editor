source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Database
gem 'pg', '~> 1.2.3'
# App server
gem 'puma', '~> 4.1'

# Asset Pipeline/Stylesheets
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'jquery-fileupload-rails'
gem 'jquery-rails'
gem 'jquery-validation-rails'
gem 'sass-rails', '>= 6'

# Auth
gem 'cancancan'
gem 'devise', '~> 4.2'

# Turbolinks makes navigating your web application faster
gem 'turbolinks', '~> 5'

gem 'google-cloud-storage', '~> 1.11'

# Transpile app-like JavaScript
gem 'webpacker', '~> 4.0'

gem 'kaminari', '~> 0.16.3'
gem 'popper_js', '~> 1.9', '>= 1.9.9'
gem 'record_tag_helper', '~> 1.0'

# Build JSON APIs with ease
gem 'jbuilder', '~> 2.7'

# Reduces boot times through caching
gem 'bootsnap', '>= 1.4.2', require: false

gem 'mini_magick', '~> 4.5', '>= 4.5.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
end

group :development do
  gem 'brakeman', require: false
  gem 'listen', '~> 3.2'
  gem 'reek'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
