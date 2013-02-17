class Section
  include MongoMapper::Document
  key :name, String
  
  #Validations
  validate :name, :presence => true, :uniqueness => true
  #validate that it has a venue
  #Index the name
  ensure_index [[:name, 1]], :unique => true

  #Relationships
  belongs_to :venue

end
