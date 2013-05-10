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

  #doesn't work if venue is changed after event was created
  after_save :copy_seating

  validate :validate_month, :validate_day, :validate_year
  #before_save :generate_date
  
  #Name and date need to be unique
  #validate format of month day and year
  validates_uniqueness_of :name, :scope => [:month, :day, :year]
  
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
  
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  has_many :event_sections
  #has_many :appearance


  searchable do
   text :name
   text :description
  end

  def generate_groups()
    if(Group.where(event_id: self.id).exists?)
      false
    else
      seats = nil
      self.event_sections.each do |section|
        EventSeat.where(event_section_id: section.id).all.each do |event_seat|
          if(Group.where(row: event_seat.seat.row).exists?)
            @group = Group.where(row: event_seat.seat.row).all.first
            event_seat.group = @group
            event_seat.save()
            @group.size += 1
            @group.reload
            @group.save()
          else
            @group = Group.create!(size: 0, event: self, row: event_seat.seat.row)
            event_seat.group = @group
            event_seat.save()
            @group.reload
            @group.size = 1
            @group.save()
            #return Group.where(size: 1).exists? #(row: event_seat.seat.row).all
          end
        end
      end
      true
    end
  end

  def copy_seating
    @venue = self.venue
    @venue.sections.each do |section|
      @es = EventSection.create(section: section, event: self)
      section.seats.each do |seat|
        EventSeat.create(event_section: @es, seat: seat, status: EventSeat::Status::UNSOLD)
      end
    end
  end
end
