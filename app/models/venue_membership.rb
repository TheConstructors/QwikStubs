class VenueMembership
  include MongoMapper::Document

  key :role, String

  #RELATIONSHIP
  belongs_to :venue
  belongs_to :promoter
end
