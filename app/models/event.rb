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
  
  before_save :validate_month
  before_save :validate_day
  before_save :validate_year
  
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
  
  def validate_month
    all_months = ["Jan","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    all_months.include? month
  end
  
  def validate_day
    month31 = ["Jan", "Mar", "May", "Jul", "Aug", "Oct", "Dec"]
    month30 = ["Sep", "Apr", "Jun", "Nov"]
    if(day.length != 2)
      return false
    elsif (month31.include? month) && (day.to_i <= 31) && (day.to_i > 0)
      return true
    elsif (month30.include? month) && (day.to_i <= 30) && (day.to_i > 0)
      return true
    elsif (month == "Feb") && (day.to_i <= 29) && (day.to_i > 0)
      return true
    else
      return false
    end
  end
  
  def validate_year
    if (year.length != 4)
      return false
    elsif(year.to_i < 0)
      return false
    else
      return true
    end
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