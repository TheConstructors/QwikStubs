class Order
  include ApplicationModel
  key :order_number, Integer
  key :total_amount, Float
  
  #Validations
  validates_presence_of :order_number
  validates_presence_of :total_amount
  validates :order_number, :uniqueness => true
  #validates_randomness_of :order_number (?)
  
  #Relationships
  has_many :event_seat
  belongs_to :billing_info

  # add randomization to this later
  def self.generateOrderNumber # may have race condition if parallelizing
    if Order.empty?
      0
    else 
      Order.sort(:order_number).last.order_number + 1
    end
  end

  def reserveSeats(seats)
    seats.each { |seat|
      if(seat.status != 0)
        return false
      end
    }
    seats.each { |seat|
      seat.status = 1
      seat.order = self
      seat.save()
    }
    true
  end

  def purchaseSeats(seats)

  end

  def releaseSeats(seats)

  end
end
