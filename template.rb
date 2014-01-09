gem 'devise'
gem 'haml-rails'

gem_group :development do
  gem 'erb2haml'
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
  gem "spring-commands-rspec", require: false
end

gem_group :development, :test do
  gem 'factory_girl_rails'
  gem "better_errors"
  gem "binding_of_caller"
  gem "database_rewinder"
end

run "bundle install"
run "bundle exec rails g rspec:install"
run "mkdir spec/support"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/devise.rb -O spec/support/devise.rb"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/factory_girl.rb -O spec/support/factory_girl.rb"
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
run "git init"
run "cp config/database.yml config/database.yml.example"
run "echo 'config/database.yml' >> .gitignore"
run "git add . && git commit -m 'initial commit'"
