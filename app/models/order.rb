class Order
  include ApplicationModel
  key :order_number, String
  key :total_amount, Float
  
  #Validations
  validates_presence_of :order_number
  validates_presence_of :total_amount
  validates :order_number, :uniqueness => true
  #validates_randomness_of :order_number (?)
  
  #Relationships
  #has_many :event_sections  EVENT BRANCH NEEDS TO BE MERGED FIRST
  belongs_to :billing_info


end
