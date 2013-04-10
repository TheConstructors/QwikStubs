class PromoterMembership
  include MongoMapper::Document

  key :role, String

  #RELATIONSHIP
  belongs_to :user
  belongs_to :promoter

  validates_presence_of :user
  validates_presence_of :promoter
  # validates_presence_of :role     # is this validation necessary?

  # validates_associated makes sure that a User is already created in the DB.
  # This ensures that you can't create a new User when you create the new membership,
  # For example:
  #   p_m = PromoterMembership(role: "CEO", user: User.new, promoter: @promoter)
  # would not be allowed
  validates_associated :user 

  # NOTE: It might be necessary to put some kind of check in Mongo to prevent this type 
  # of data from being entered...
  # see: http://stackoverflow.com/questions/6155396/validates-presence-of-with-belongs-to-associations-the-right-way   

end
