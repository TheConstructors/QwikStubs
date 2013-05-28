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
    MongoMapper.database.collection("groups-test").drop() 
    sections = Event.find(event_id).event_sections.map(&:id)
    debugger
    map = <<-MAP
      function() {
        var sections = #{sections.as_json};
        var id = this.event_section_id;
        /* Use weak equality for Id conversion */
        var contains = function(array, value) {
          return array.reduce(function(accum, item) {
            return accum || (item == value);
          }, false);
        };
        if (contains(sections, id))
          emit(this.row, { id: this["_id"] });
        //else 
         // emit(-1, -1);
        }
    MAP
    reduce = <<-REDUCE
      function(key, values) {
        var ids = [];
        values.forEach(function(seat) {
          if (seat.id !== null) ids.push(seat.id);
        });
        return { seats: ids };
      }
    REDUCE
    # purge temporary table
    init_groups = collection.map_reduce(map, reduce, out: "groups-test").find()
    # remove dead collections
    # allocate groups with event_id
    # then make request with event_id and size
    #
  end
  
  private

  def self.to_object_id(array)
    ids = array.map do |each|
      "ObjectId(\"#{each}\")"
    end
    "[" + ids.join(",") + "]"
  end
end
