class Event
  include ApplicationModel

  key :name, String
  key :description, String
  key :day, String
  key :year, String
  key :month, String
  key :time, String
  
  searchable do
   text :name
   text :description
  end

  validates_presence_of :name
  validates_presence_of :month
  validates_presence_of :day
  validates_presence_of :year
  #Name and date need to be unique
  validates_uniqueness_of :name, :scope => :month # should include day
  # and year
  
  
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  #has_many :eventsection
  #has_many :appearance
end
