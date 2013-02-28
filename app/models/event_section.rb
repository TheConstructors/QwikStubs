class EventSection
  include MongoMapper::Document

  key:price, Float
  
  #validations
  validate :price, :presence => true

  #relationships
  belongs_to :event
  belongs_to :section
  #has_many :eventseat

end
