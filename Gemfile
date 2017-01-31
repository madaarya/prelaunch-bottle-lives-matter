source 'https://rubygems.org'

# ruby '2.3.0'

gem 'activeadmin', '1.0.0.pre2'
gem 'delayed_job_active_record', '~> 4.0.3'
gem 'daemons'
gem 'devise'
gem 'pg'
gem 'rails', '4.2.5.2'
gem 'jquery-rails'
gem 'unicorn'
gem 'therubyracer',  platforms: :ruby
gem "dotenv-rails"
gem "delayed_job_web"
gem "gritter", "1.2.0"
gem 'bootstrap-sass'
gem 'rest-client'
gem "mediaelement_rails"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 4.1.0'
  gem 'sass-rails',   '~> 5.0.1'
  gem 'uglifier'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '3.4.2'
  gem 'rspec-mocks', '3.4.1'
  gem 'test-unit', '~> 3.0'
end

group :development do
  gem 'quiet_assets'
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-rvm'
  gem 'capistrano-unicorn-nginx', github: 'madaarya/capistrano-unicorn-nginx'
  gem 'capistrano-delayed-job', '~> 1.0'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :production do
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
end
