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
  has_many :event_seats
  belongs_to :billing_info
  belongs_to :event

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
      if(seat.status != EventSeat::Status::UNSOLD)
        return false
      end
    }
    seats.each { |seat|
      seat.status = EventSeat::Status::RESERVED
      seat.order = self
      seat.save()
    }
    true
  end

  def purchaseSeats(seats)
    seats.each { |seat|
      if(seat.status != EventSeat::Status::RESERVED)
        return false
      end
    }
    seats.each { |seat|
      seat.status = EventSeat::Status::SOLD
      seat.order = self
      seat.save()
    }
    true
  end

  def releaseSeats(seats)
    seats.each { |seat|
      if(seat.status != EventSeat::Status::RESERVED)
        return false
      end
    }
    seats.each { |seat|
      seat.status = EventSeat::Status::UNSOLD
      seat.order = self
      seat.save()
    }
    true
  end
  
  def seat_data
    event_seats #.map { |e| e.id } 
  end

  def trigger_release
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:release', seat_data)
  end

  def trigger_reserve
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:reserve', seat_data)
  end

  def trigger_purchase
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:purchase', seat_data)
  end
end
