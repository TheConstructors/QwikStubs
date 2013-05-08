class Section
  include ApplicationModel 
  
  key :name, String
  key :xpos, Integer
  key :ypos, Integer
  
  validates_uniqueness_of :name, :scope => :venue

  ensure_index [[:name, 1]], :unique => true

  has_many :seats
  belongs_to :venue
end
