if yes?("Do you need to use devise?")
  gem 'devise' if yes?("Do you need devise?")
  has_devise = true
end
gem 'haml-rails'
gem 'font-awesome-rails' if yes?("Do you need to use fontawesome")
if yes?("Do you need to use twitter bootstrap?")
  gem 'therubyracer'
  gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git', branch: 'bootstrap3'
end
gem 'simple_form'

gem_group :development do
  gem 'erb2haml'
  gem 'pry-rails'
  gem 'guard-rspec'
  gem 'guard-livereload', require: false
  gem 'quiet_assets'
  gem 'letter_opener'
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
end

run "bundle install"
run "bundle exec rake haml:replace_erbs"
run "bundle exec rails g rspec:install"
run "bundle exec guard init rspec"
run "bundle exec guard init livereload"
run "bundle exec spring binstub --all"
run "mkdir spec/support"
run "wget https://raw.github.com/kmiyake/rails_app_template/master/devise.rb -O spec/support/devise.rb" if has_devise
run "wget https://raw.github.com/kmiyake/rails_app_template/master/factory_girl.rb -O spec/support/factory_girl.rb"
git :init
run "cp config/database.yml config/database.yml.example"
run "echo 'config/database.yml' >> .gitignore"
run "echo 'coverage/' >> .gitignore"
git add: "."
git commit: "-a -m 'Initial commit'"
run "powder link" if yes?("Do you use pow?")
