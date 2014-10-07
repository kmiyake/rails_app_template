add_source 'https://rails-assets.org'

# Authentication
if yes?("Do you need devise?")
  gem 'devise'
  has_devise = true
end
gem 'omniauth-facebook' if yes?("Do you need facebook oauth?")
gem 'omniauth-github' if yes?("Do you need github oauth?")
gem 'omniauth-twitter' if yes?("Do you need twitter oauth?")

# Views
gem 'haml-rails'
gem 'simple_form', '3.1.0.rc2'

# Assets
if yes?("Do you need backbone?")
  gem 'rails-assets-backbone'
  gem 'rails-assets-marionette'
end
if yes?("Do you need bootstrap?")
  gem 'rails-assets-bootstrap', '3.1.1'
  has_bootstrap = true
end
gem 'rails-assets-fontawesome' if yes?("Do you need fontawesome?")

# Configuration
if yes?("Do you need rails_config?")
  gem 'rails_config'
  has_rails_config = true
end

gem_group :development do
  gem 'erb2haml'
  gem 'pry-rails'
  gem 'guard-rspec'
  gem 'guard-livereload', require: false
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'spring-commands-rspec'
end

gem_group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'poltergeist'
  gem 'simplecov', '~> 0.7.1', require: false
  gem 'database_rewinder'
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
end

run "bundle install"
run "bundle exec rake haml:replace_erbs"
run "bundle exec rails g rspec:install"
if has_bootstrap
  run "bundle exec rails g simple_form:install --bootstrap"
else
  run "bundle exec rails g simple_form:install"
end
run "bundle exec rails g rails_config:install" if has_rails_config

run "mkdir spec/support"
if has_devise
  run "bundle exec rails g devise:install"
  run "wget https://raw.github.com/kmiyake/rails_app_template/master/devise.rb -O spec/support/devise.rb"
end
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/factory_girl.rb -O spec/support/factory_girl.rb"
git :init
run "cp config/database.yml config/database.yml.example"
run "echo 'config/database.yml' >> .gitignore"
run "echo 'coverage/' >> .gitignore"
git add: "."
git commit: "-a -m 'Initial commit'"
run "powder link" if yes?("Do you use pow?")
