gem 'devise'
gem 'haml-rails'

gem_group :development do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-livereload'
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
run "mkdir spec/support"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/devise.rb -O spec/support/devise.rb"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/factory_girl.rb -O spec/support/factory_girl.rb"
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
