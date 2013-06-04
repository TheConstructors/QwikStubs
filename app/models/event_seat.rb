require 'pry'

class EventSeat
  include ApplicationModel
  
  module Status
    UNSOLD = 0
    RESERVED = 1
    SOLD = 2
    CHECKED = 3
  end

  key :status, Integer, :default => Status::UNSOLD
  key :row, Integer
  key :column, Integer
  
  validates_numericality_of :status, :greater_than => -1
  validates_numericality_of :status, :less_than => 4

  validates_presence_of :row, :column
  belongs_to :event_section
  belongs_to :seat
  belongs_to :order
  belongs_to :group

  def self.get_seats(event)
    event_sections = event.event_sections.map(&:id)
    event_seats = MongoMapper.database.collection('event_seats').aggregate(
      [{ :$match => { event_section_id: { :$in => event_sections } }},
       { :$sort => { seat_id: 1 }}])
    sections = event.venue.sections.map(&:id)
    seats = MongoMapper.database.collection('seats').aggregate(
      [{ :$match => { section_id: { :$in => sections } }},
       { :$sort => { _id: 1 }}])
    ret = []
    (0...seats.length).each do |i|
      ret << {id: event_seats[i]["_id"], venue_seat: seats[i], event_seat: event_seats[i] }
    end
    ret
  end
  
  def self.group_by_row(event_id)
    sections = Event.find(event_id).event_sections.map(&:id)
    MongoMapper.database.collection("groups-test").drop()
    MongoMapper.database.collection('event_seats').
                aggregate([{ :$match => { event_section_id: { :$in => sections } }},
                           { :$group => { :_id => { row: "$row", :event_section_id => "$event_section_id"},
                                                          :seats => {:$addToSet=>"$_id"}}}])
  end

  def checkin
    status = Status::CHECKED
    channel_id = self.event_section.event.id.to_s
    Pusher.trigger(channel_id, 'event_seat:checkin', self)
  end
  
  # quality should be attached to event_seats to speed up the algorithm
  def quality
    seat.quality
  end

  def get_price
    event_section.price
  end
end
