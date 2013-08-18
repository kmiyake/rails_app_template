gem 'devise'
gem 'haml-rails'

gem_group :development do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
end

gem_group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'spring'
end

run "bundle exec rails g rspec:install"
run "bundle exec guard init rspec"
