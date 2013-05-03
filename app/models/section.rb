class Section
  include MongoMapper::Document
  key :name, String
  key :xpos, Integer
  key :ypos, Integer

  
  #Validations
  validates_uniqueness_of :name, :scope => :venue

  #Index the name
  ensure_index [[:name, 1]], :unique => true

  #Relationships
  has_many :seat
  belongs_to :venue

end
