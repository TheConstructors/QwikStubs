class Promoter
  include MongoMapper::Document
  
  key :name, String
  #key :verified, Boolean (Adding this later)
  
  #RELATIONSHIP
  has_many :membership 
  #TO DO (Add Event relationship): ,:event 


end
