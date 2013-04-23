class VenueMembership
  include MongoMapper::Document

  key :role, String

  #RELATIONSHIP
  belongs_to :venue
  belongs_to :promoter

  validates_presence_of :venue
  validates_presence_of :promoter

  # validates_associated makes sure that a Promoter is already created in the DB.
  # This ensures that you can't create a new Promoter when you create the new membership,
  # For example:
  #   v_m = VenueMembership(role: "Manager", venue: @v, promoter: Promoter.new)
  # would not be allowed
  validates_associated :promoter
end
