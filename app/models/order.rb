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

  def self.find_seats(event, number)
    # if we can't fufil the request fail here
    if event.total_seats < event.sold_seats + number
     return nil
    end

    updated = nil
    while !updated
      #debugger
      group = Group.where(event_id: event.id, reserved: 0, :size.gte => number).sort(:size.asc).limit(1).first
      updated = group && group.set(reserved: 1)["updatedExisting"]
    end
    group.reload
    acquired = group.event_seats.take(number)
    free = group.event_seats.drop(number)
    # clean up tomorrow 
    reserved_group = Group.create event_id: event.id, reserved: 1, :size => number
    # generate order here
    free_group = Group.create event_id: event_id, reserved: 0, :size => group.size - number
    free.each do |seat|
      seat.group = free_group
    end
    reserved_group.save && free_group.save
  end
end
