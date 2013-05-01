class EventSeat
  include MongoMapper::Document
  
  module Stat
    UNSOLD = 0
    RESERVED = 1
    SOLD = 2
  end

  key :status, Integer
  
  validates_numericality_of :status, :greater_than => -1
  validates_numericality_of :status, :less_than => 3

  belongs_to :event_section
  belongs_to :seat
  has_many :orders
end
