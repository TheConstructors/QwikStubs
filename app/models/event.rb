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
  validates_presence_of :venue


  #doesn't work if venue is changed after event was created
  after_save :copy_seating

  #Name and date need to be unique
  validates_uniqueness_of :name, :scope => [:month, :day, :year]
    
  #Relationships
  belongs_to :venue
  belongs_to :promoter
  has_many :event_section
  #has_many :appearance

  def generate_groups()
    group = Group.where(event_id: self.id).all
    if(!group.empty?)
      false
    else
      
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
