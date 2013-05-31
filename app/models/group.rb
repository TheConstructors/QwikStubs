class Group
  include ApplicationModel

  module Reserved
    NO = 0
    YES = 1
  end

  key :size, Integer
  key :row, Integer
  key :quality, Integer
  key :reserved, Integer, :default => Reserved::NO

  belongs_to :event
  has_many :event_seats

  validate :event_matches_event_seat
  validate :size_matches_event_seat

  private
  def event_matches_event_seat
    event_seats.each do |seat|
      if event != seat.event_section.event
        errors.add(:group_match, "The event seats don't match the event.") 
      end 
    end
  end

  private
  def size_matches_event_seat
    if event_seats.size != self.size
      errors.add :size_match, "The size and number of seats do not match."
    end
  end
end
