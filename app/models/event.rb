#require 'pry'
require 'sunspot_ext'

class Event
  include ApplicationModel
  
  key :name, String
  key :description, String
  key :day, String
  key :year, String
  key :month, String
  key :time, String
  key :date, String, :default => ""
  key :banner_url, String
  key :photo_url, String
  key :total_seats, Integer, :default => 0
  key :sold_seats, Integer, :default => 0

  #Relationships
  belongs_to :venue
  belongs_to :promoter
  has_many :event_sections
  has_many :groups
  has_many :orders
  #has_many :appearance

  validates_presence_of :name
  validates_presence_of :month
  validates_presence_of :day
  validates_presence_of :year

  #doesn't work if venue is changed after event was created
  after_save :copy_seating

  validate :validate_month, :validate_day, :validate_year
  #before_save :generate_date
  
  #Name and date need to be unique
  #validate format of month day and year
  validates_uniqueness_of :name, :scope => [:month, :day, :year]

  searchable do
   text :name
   text :description
  end

  def date
    date=""
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
    end
    date+=day
    date+=year
  end
  
  def validate_month
    all_months = ["Jan","Feb","Mar","Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    if !(all_months.include? month)
      errors.add(:month, "Month is not formatted correctly.")
    end
  end
  
  def validate_day
    month31 = ["Jan", "Mar", "May", "Jul", "Aug", "Oct", "Dec"]
    month30 = ["Sep", "Apr", "Jun", "Nov"]
    if(day.length != 2)
      errors.add(:day, "Wrong day length.")
    elsif (month31.include? month) && ((day.to_i > 31) || (day.to_i <= 0))
      errors.add(:day, "Day does not fall within the month")
    elsif (month30.include? month) && ((day.to_i > 30) || (day.to_i <= 0))
      errors.add(:day, "Day does not fall within the month")
    elsif (month == "Feb") && ((day.to_i > 29) || (day.to_i <= 0))
      errors.add(:day, "Day does not fall within the month")
    else
    end
  end
  
  def validate_year
    if (year.length != 4)
      errors.add(:year, "Invalid year length.")
    elsif(year.to_i < 0)
      errors.add(:year, "Can't have a negative year value")
    else
    end
  end  

  def copy_seating
    if EventSection.where(event_id: id).size == 0
      @venue = self.venue
      @venue.sections.each do |section|
        @es = EventSection.create(section: section, event: self)
        section.seats.each do |seat|
        EventSeat.create(event_section: @es, seat: seat, 
                         status: EventSeat::Status::UNSOLD,
                         row: seat.row, column: seat.column)  
        end
      end
    end
  end

  def self.fuzzy_search(text)
    names = Event.search do |q|
      q.fuzzy(:name, text)
    end

    descriptions = Event.search do |q|
      q.fuzzy(:description, text)
    end

    normal = Event.search do |q|
      q.fulltext text
    end

    names.results + descriptions.results + normal.results
  end

  def seats
    self.event_sections.map(&:event_seats).flatten
  end

  def generate_groups
    groups_data = EventSeat.group_by_row(self.id)

    groups = groups_data.map do |group_data|
      group = Group.create(row: group_data["_id"]["row"],
                           section: group_data["_id"]["column"],
                           event: self,
                           size: 0)

      seats = group_data["seats"]

      EventSeat.find(seats).each do |es|
        es.group = group
        es.save!
        group.size += 1
        self.total_seats += 1
      end
      group.save && group
    end
    self.save
    groups
  end
end
