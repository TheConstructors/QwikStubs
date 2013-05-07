class Seat
  include ApplicationModel 

  key :name, String
  key :row, String
  key :column, String
  key :xpos, Integer
  key :ypos, Integer
  key :quality, Integer #for seating algorithm

  validates_presence_of :name

  # Make sure the combination of name, section is unique
  #validates_uniqueness_of :name, :scope => :section

  # Relationships
  belongs_to :section
  has_many :event_seats
end
