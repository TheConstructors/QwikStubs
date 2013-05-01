class Event
  include ApplicationModel
  
  key :name, String
  key :description, String
  key :day, String
  key :year, String
  key :month, String
  key :time, String
  
  validates_presence_of :name
  validates_presence_of :month
  validates_presence_of :day
  validates_presence_of :year
  #Name and date need to be unique
  validates_uniqueness_of :name, :scope => [:month, :day, :year]

  
  
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  has_many :eventSection
  #has_many :appearance


end
