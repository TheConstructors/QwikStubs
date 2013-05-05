class Event
  include ApplicationModel
  require 'date'
  
  key :name, String
  key :description, String
  key :day, String
  key :year, String
  key :month, String
  key :time, String
  key :date, Date
  validates_presence_of :name
  validates_presence_of :month
  validates_presence_of :day
  validates_presence_of :year
  validates_presence_of :date
  #Name and date need to be unique
  validates_uniqueness_of :name, :scope => [:month, :day, :year]
    
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  has_many :event_section
  #has_many :appearance

  def generateGroups()
    Group.where(event: self).first
    #if(@groups != 0)
    #  false
    #end
    #true
  end

end