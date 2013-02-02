class User
  include MongoMapper::Document
  
  key :first, String
  key :last, String

  # Relationships
  has_many :emails

end
