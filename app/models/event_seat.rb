require 'pry'

class EventSeat
  include ApplicationModel
  
  module Status
    UNSOLD = 0
    RESERVED = 1
    SOLD = 2
  end

  key :status, Integer, :default => Status::UNSOLD
  key :row, Integer
  key :column, Integer
  
  validates_numericality_of :status, :greater_than => -1
  validates_numericality_of :status, :less_than => 3

  validates_presence_of :row, :column
  belongs_to :event_section
  belongs_to :seat
  belongs_to :order
  belongs_to :group
  
  def self.group_by_row(event_id)
    sections = Event.find(event_id).event_sections.map(&:id)
    MongoMapper.database.collection("groups-test").drop()
    MongoMapper.database.collection('event_seats').
                aggregate([{ :$match => { event_section_id: { :$in => sections } }},
                           {:$group => {:_id=>"$row", :seats => {:$addToSet=>"$_id"}}}])
  end
end
