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
  #gem 'less-rails-bootstrap' #added manually
  #gem 'therubyracer'  

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Yay! Debugger
gem 'debugger'

# MongoDB
gem 'mongo_mapper'
gem 'bson_ext'

# Bcrypt (for password Hashing)
gem 'bcrypt-ruby'

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
    
    # Guard and Spork
    gem 'guard-rspec'
    gem 'guard-spork'
    gem 'spork'

    # Linux dependency for notifications
    gem 'rb-inotify', '~> 0.9'
 end

# Gemfile
gem 'mocha', :require => false
