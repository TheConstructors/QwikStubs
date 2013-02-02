class Membership
 
 include MongoMapper::Document
  
  key :role, String

  #RELATIONSHIP
  belongs_to :user
  belongs_to :promoter

end
