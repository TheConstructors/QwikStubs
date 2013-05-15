#require 'pry'

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

  def self.grouped_by()
    map_function = "function() { emit(this.row, this); }"
    
    # put your logic here (not needed in my case)
    reduce_function = %Q( function(_row, _seats) { 
      return { row: _row, seats:_seats };
    })
#    pry self
    collection.map_reduce(map_function, reduce_function, {out: "map_reduce_rows"}).find()
  end

end
