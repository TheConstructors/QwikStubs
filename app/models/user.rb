class User
  include MongoMapper::Document
  
  key :first, String
  key :last, String

  validates :first, :presence => true
  validates :last, :presence => true
  # Relationships
  has_many :emails

end
