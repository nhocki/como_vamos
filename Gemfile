source 'https://rubygems.org'

ruby "2.2.0"

gem 'rails', '4.2.0'
gem 'pg', '~> 0.17.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.1.2'
gem "friendly_id", "~> 5.0.4"
gem "omniauth-github", "~> 1.1.2"
gem "carrierwave", "~> 0.10.0"
gem "fog", "~> 1.24.0"
gem "httparty", "~> 0.13.3"
gem "airbrake", "~> 4.1.0"
gem "kaminari", "~> 0.16.1"

gem "skylight", "~> 0.5.1"
gem "mixpanel-ruby", "~> 1.6.0"
gem "analytics-ruby", "~> 2.0.12", require: 'segment/analytics'
gem "naught", "~> 1.0.0"

# Fix font assets with the CDN.
gem "font_assets", "~> 0.1.11"

# Markdown support.
gem "redcarpet", "~> 3.2.1"
gem "pygments.rb", "~> 0.6.0"

# Styling. Thanks Thoughtbot!
gem "bitters", "~> 0.10.1"
gem "bourbon", "~> 3.2.3"
gem "neat", "~> 1.5.1"
gem "font-awesome-sass", "~> 4.2.2"
gem "simple_form", "~> 3.1.0"
gem "chosen-rails", "~> 1.2.0"

# Unicorn as server
gem "unicorn", "~> 4.8.3"
gem "unicorn-worker-killer", "~> 0.4.2"

group :development do
  gem 'spring', '~> 1.1.3'
  gem "quiet_assets", "~> 1.0.3"
  gem "web-console", "~> 2.0.0"
end

group :development, :test do
  gem "rspec-rails", "~> 3.1.0"
  gem "dotenv-rails", "~> 1.0.2"
  gem "factory_girl_rails", "~> 4.5.0"
  gem "capybara", "~> 2.4.4"
end

group :test do
  gem 'shoulda-matchers', require: false
end

group :production do
  gem "rails_12factor", "~> 0.0.3"
  gem "rails_serve_static_assets", "~> 0.0.4"
  gem "dalli", "~> 2.7.2"
end
