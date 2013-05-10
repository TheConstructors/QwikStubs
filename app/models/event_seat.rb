class EventSeat
  include ApplicationModel
  
  module Status
    UNSOLD = 0
    RESERVED = 1
    SOLD = 2
  end

  key :status, Integer, :default => Status::UNSOLD
  
  validates_numericality_of :status, :greater_than => -1
  validates_numericality_of :status, :less_than => 3

  belongs_to :event_section
  belongs_to :seat
  belongs_to :order
  belongs_to :group

  def self.grouped_by(column, options = {})
    map_function = "function() { emit(this.#{column}, this.id); }"
    
    # put your logic here (not needed in my case)
    reduce_function = %Q( function(key, values) { 
      return true;
    })
    
    collection.map_reduce(map_function, reduce_function, options)
  end

end
