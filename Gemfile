source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
  
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'twitter-bootstrap-rails'

  gem 'uglifier', '>= 1.0.3'
end

# Backbone
gem 'backbone-on-rails'

# Jquery
gem 'jquery-rails'

# Debugger
gem 'debugger'

# MongoDB
gem 'mongo_mapper'
gem 'bson_ext'

# Bcrypt (for password Hashing)
gem 'bcrypt-ruby'

# requires libqrencoder to be installed 
# gem 'qrencoder'

# for testing
group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  
  # Better Error Messages
  gem "better_errors"
  
  # If we upgrade to Ruby 2.0
  # gem "binding_of_caller"
  
  # Factories 
  gem 'factory_girl_rails'    
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  
  # Guard with RSpec 
  gem 'guard-rspec'

  # for Linux notifications using Guard
  # gem 'rb-inotify', '~> 0.9'

  # Jasmine JavaScript Testing
  gem 'jasminerice'

  # Coveralls
  gem 'coveralls', :require => false

  gem "sunspot-rails-tester", "~> 1.0.0"

 end

# Gemfile
gem 'mocha', :require => false

# Sunspot
gem 'sunspot_rails', '~> 2.0'
gem 'sunspot_solr'
gem 'sunspot_mongo_mapper', :github => 'bkeepers/sunspot_mongo_mapper'
