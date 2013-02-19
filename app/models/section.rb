class Section
  include MongoMapper::Document
  key :name, String
  key :xpos, Integer
  key :ypos, Integer

  
  #Validations
  validate :name, :presence => true, :uniqueness => true
  #validate that it has a venue
  #Index the name
  ensure_index [[:name, 1]], :unique => true

  #Relationships
  has_many :seat
  belongs_to :venue

end
