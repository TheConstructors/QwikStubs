ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...

  def setup
    MongoMapper.database.collections.each do |coll|
      coll.remove
    end
  end

end
