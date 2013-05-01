class Section
  include ApplicationModel 
  
  key :name, String
  key :xpos, Integer
  key :ypos, Integer

  validate :name, :presence => true, :uniqueness => true

  ensure_index [[:name, 1]], :unique => true

  has_many :seat
  belongs_to :venue
end
