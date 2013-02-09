class Venue < ApplicationModel
  key :name, String
  key :city, String
  key :state, String

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :state

  # Make sure the combination of name, city, and state is unique
  validates_uniqueness_of :name, :scope => [:city, :state]


  # Relationships
  # has_many :events
  # has_many :sections

end
