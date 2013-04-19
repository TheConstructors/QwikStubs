class Event
  include MongoMapper::Document
  
  key :name, String
  key :date, String
  key :time, String
  
  validates_presence_of :name
  validates_presence_of :date
  #Name and date need to be unique
  validates_uniqueness_of :name, :scope => :date
  
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  #has_many :eventsection
  #has_many :appearance


end
