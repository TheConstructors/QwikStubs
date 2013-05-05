class Event
  include ApplicationModel
  
  key :name, String
  key :description, String
  key :day, String
  key :year, String
  key :month, String
  key :time, String
  key :date, String, :default => ""
  
  validates_presence_of :name
  validates_presence_of :month
  validates_presence_of :day
  validates_presence_of :year
  validates_presence_of :date
  
  #Name and date need to be unique
  #validate format of month day and year
  validates_uniqueness_of :name, :scope => [:month, :day, :year]
  
  def date
    date = ""
    case month
    when "Jan"
      date+="01"
    when "Feb"
      date+="02"
    when "Mar"
      date+="03"
    when "Apr"
      date+="04"
    when "May"
      date+="05"
    when "Jun"
      date+="06"
    when "Jul"
      date+="07"
    when "Aug"
      date+="08"
    when "Sep"
      date+="09"
    when "Oct"
      date+="10"
    when "Nov"
      date+="11"
    when "Dec"
      date+="12"
    else
      date+="13"
    end
    date+=day
    date+=year
  end
    
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