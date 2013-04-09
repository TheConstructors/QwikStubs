class Promoter
  include ApplicationModel

  key :name, String
  key :verified, Boolean 

  validates_presence_of :name
  
  #RELATIONSHIP
  has_many :promoter_memberships
  has_many :venue_memberships
  #TO DO (Add Event relationship): ,:event

end
