class Order
  include ApplicationModel
  key :order_number, Integer
  key :total_amount, Float
  
  #Validations
  validates_presence_of :order_number
  validates_presence_of :total_amount
  validates :order_number, :uniqueness => true
  validates_presence_of :event
  #validates_randomness_of :order_number (?)
  
  #Relationships
  has_many :event_seats
  belongs_to :billing_info
  belongs_to :event

  # add randomization to this later
  def self.generate_order_number # may have race condition if parallelizing
    if Order.empty?
      0
    else 
      Order.sort(:order_number).last.order_number + 1
    end
  end

  def trigger_release(seats)
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:release', seats)
  end

  def trigger_reserve(seats)
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:reserve', seats)
  end

  def trigger_purchase(seats)
    channel_id = event.id.to_s
    Pusher.trigger(channel_id, 'order:purchase', seats)
  end

  def reserve_seats(seats)
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
    trigger_reserve(seats)
    true
  end

  def purchase_seats(seats)
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
    trigger_purchase(seats)
    true
  end

  def release_seats(seats)
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
    trigger_release(seats)
    true
  end

  def find_seats(num_seats)
    update = false
    while update != true
      @group = Group.where(reserved: 0, event_id: event.id, :size.gte => num_seats).sort(:quality).all.first
      update = Group.set({_id: @group.id, reserved: 0}, {reserved: 1})
      update = update["updatedExisting"]
    end
    @group.reload
    seats = @group.event_seats.sort(:column).all[0..(num_seats-1)]
    seats.each do |seat|
      seat.group = nil
      seat.status = EventSeat::Status::RESERVED
      seat.save()
    end
    @group.reload
    if @group.size <= num_seats
      @group.delete()
    else
      @group.size = @group.event_seats.size
      @group.reserved = 0
      if !@group.save()
        false
      end
    end
    seats
  end
end
