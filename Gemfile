source 'http://rubygems.org'

gem 'rails', '3.1.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'thin'

    gem 'linkedin'

group :development do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :production do
  gem 'pg'
  gem 'thin'
end



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5.rc.2'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'resque'
gem 'redis'
gem "oauth-plugin", ">= 0.4.0.pre1"
gem 'jquery-rails'
gem 'rails3-jquery-autocomplete', :git => 'https://github.com/gmassanek/rails3-jquery-autocomplete.git'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'rspec'
end
