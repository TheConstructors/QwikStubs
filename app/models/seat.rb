class Seat
  include MongoMapper::Document

  key :name, String
  key :row, String
  key :column, String
  key :xpos, Integer
  key :ypos, Integer

  validates_presence_of :name

  # Make sure the combination of name, section is unique
#  validates_uniqueness_of :name, :section

  # Relationships
  belongs_to :section

end
