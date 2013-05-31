require 'uuid'

class Order
  include ApplicationModel
  key :order_number, Integer
  key :total_amount, Float# , :default => 5
  
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
  # change to uuid
  
  def self.generate_number # may have race condition if parallelizing
    UUID.new.generate
  end

  def trigger_release(seats)
    channel_id = self.event.id.to_s
    Pusher.trigger(channel_id, 'order:release', seats)
  end

  def trigger_reserve(seats)
    channel_id = self.event.id.to_s
    Pusher.trigger(channel_id, 'order:reserve', seats)
  end

  def trigger_purchase(seats)
    channel_id = self.event.id.to_s
    Pusher.trigger(channel_id, 'order:purchase', seats)
  end

  def reserve_seats(seats)
    seats.each { |seat|
      if(seat.status != EventSeat::Status::UNSOLD)
        return false
      end
    }
    seats.each do |seat|
      seat.status = EventSeat::Status::RESERVED
      seat.order_id = id
      seat.save()
    end
    trigger_reserve(seats)
    true
  end

  def purchase_seats()
    event_seats.each { |seat|
      if(seat.status != EventSeat::Status::RESERVED)
        return false
      end
    }
    event_seats.each { |seat|
      seat.status = EventSeat::Status::SOLD
      seat.order = self
      seat.save()
    }
    trigger_purchase(event_seats)
    true
  end

  def release_seats(seats)
    seats.each do |seat|
      if(seat.status != EventSeat::Status::RESERVED)
        return false
      end
    end

    seats.each do |seat|
      seat.status = EventSeat::Status::UNSOLD
      seat.order = self
      seat.save()
    end
    trigger_release(seats)
    true
  end

  def find_seats(number)
    # if we can't fufil the request fail here
    # if event.total_seats < event.sold_seats + number
    #  return nil
    # end

    updated = nil
    check = 0
    while !updated
      #debugger
      group = Group.where(event_id: event.id, reserved: 0, :size.gte => number).sort(:size.asc).limit(1).first
      updated = group && group.set(reserved: 1)["updatedExisting"]
      if check > 9
        return nil
      end
      check += 1
      # sleep(1.0/2.0)
    end
    group.reload
    seats = group.event_seats.sort(:column)
    acquired = seats.take(number)
    start_column = acquired.first.column
    end_column = start_column + number - 1
    #debugger
    if (start_column..end_column).to_a == acquired.map(&:column)
      #allocate seats
      free = group.event_seats.drop(number)
      reserved_group = Group.create! event_id: event.id, reserved: 1, :size => 0
      acquired.each do |seat|
        seat.group = reserved_group
        seat.save!
      end
      #order = Order.new event: event
      self.reserve_seats(acquired)
      self.save!

      # generate order here
      free_group = Group.create event_id: event.id, reserved: 0, :size => 0
      free.each do |seat|
        seat.group = free_group
        seat.save!
      end
      reserved_group.reload
      reserved_group.size = number
      reserved_group.save!
      free_group.reload
      free_group.size = group.size - number
      free_group.save!
      group.delete
      return self
    else
      group.reserved = 0; group.save!
      return nil
    end
  end
end
