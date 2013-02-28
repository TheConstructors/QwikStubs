class Promoter
  include ApplicationModel

  key :name, String
  #key :verified, Boolean (Adding this later)

  #RELATIONSHIP
  has_many :membership
  has_many :event
end
