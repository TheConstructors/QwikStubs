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

  def self.get_seats(event)
    puts "$$$$1"
    event_sections = event.event_sections.map(&:id)
    puts "$$$$2"
    event_seats = MongoMapper.database.collection('event_seats').aggregate(
      [{ :$match => { event_section_id: { :$in => event_sections } }},
       { :$sort => { seat_id: 1 }}])
    puts "$$$$3"
    sections = event.venue.sections.map(&:id)
    puts "$$$$4"
    seats = MongoMapper.database.collection('seats').aggregate(
      [{ :$match => { section_id: { :$in => sections } }},
       { :$sort => { _id: 1 }}])
    puts "$$$$5"

    ret = []
    puts "$$$$6"

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
end
