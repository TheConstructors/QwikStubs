class BillingInfo
  include MongoMapper::Document
  key :full_name, String
  key :ccn, Integer
  key :address, String
  key :city, String
  key :state, String
  key :zip, String
  key :verified, Boolean

  
  #Validations
  validates_presence_of :full_name
  validates_presence_of :ccn
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :verified
  
  #Relationships
  has_many :orders
  belongs_to :user


end
