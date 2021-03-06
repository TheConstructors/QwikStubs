require 'spec_helper'

describe Order do
  before (:each) do
    @ord = FactoryGirl.create(:order, total_amount: 156.10)
  end
    
  it "should have a total amount" do
    @ord.total_amount.should == 156.10
  end
  
  it "should fail if there is no order number" do
    @no_num = Order.new()
    @no_num.valid?.should == false
  end
  
  it "should fail if there is no total amount" do
    @no_price = Order.create(order_number: "1234345")
    @no_price.errors[:total_amount].should_not be_empty
  end
  
  it "should have a unique order number" do
    @ord2 = FactoryGirl.build(:order, order_number: @ord.order_number, 
                              total_amount: "10.00")
    @ord2.valid?.should be_false
    @ord2.errors.should_not be_empty
  end
  
  it "should have billing info" do
    @ord.billing_info.should_not be_nil
  end
    
  describe "generate_order_number" do
    it "should produce a new unique order number" do
      ord_num = Order.generate_number
      @ord2 = FactoryGirl.create(:order)
      ord_num2 = Order.generate_number
      ord_num.should < ord_num2
    end
  end

  describe "reserve_seats" do
    before (:each) do
      @event = FactoryGirl.create(:event)
      @seat1 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
      @seat2 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
      @seat3 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
    end
    
    it "should set all the seats to reserved" do
      @seats = EventSeat.all
      @seats.each { |seat|
        seat.status.should == EventSeat::Status::UNSOLD
      }
      @order = FactoryGirl.build(:order, event: @event)
      @order.reserve_seats(@seats).should == true
      @seats2 = EventSeat.all
      @seats2.each { |seat|
        seat.status.should == EventSeat::Status::RESERVED
      }
    end

    it "should return false with a seat marked sold or reserved" do
      @seat4 = FactoryGirl.create(:event_seat, status: EventSeat::Status::SOLD)
      @seats = EventSeat.all
      @order = FactoryGirl.build(:order, event: @event)
      @order.reserve_seats(@seats).should == false
      @seat4.status = EventSeat::Status::RESERVED
      @seat4.save()
      @seats = EventSeat.all
      @order.reserve_seats(@seats).should == false
    end      
  end

  describe "purchase_seats" do
    before (:each) do
      @event = FactoryGirl.create(:event)
      @seat1 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
      @seat2 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
      @seat3 = FactoryGirl.create(:event_seat, status: EventSeat::Status::UNSOLD)
    end
    
    it "should set all the seats to reserved" do
      @seats = EventSeat.all
      @seats.each { |seat|
        seat.status.should == EventSeat::Status::UNSOLD
      }
      @order = FactoryGirl.build(:order, event: @event)
      @order.reserve_seats(@seats).should == true
      @order.purchase_seats().should == true
      @seats2 = EventSeat.all
      @seats2.each { |seat|
        seat.status.should == EventSeat::Status::SOLD
      }
    end

    it "should return false with a seat marked sold or unsold" do
      @seats = EventSeat.all
      @order = FactoryGirl.build(:order, event: @event)
      @order.reserve_seats(@seats).should == true
      @seats[0].status = EventSeat::Status::SOLD
      @seats[0].save()
      @order.purchase_seats().should == false
      @seats[0].status = EventSeat::Status::UNSOLD
      @seats[0].save()
      @order.purchase_seats().should == false
    end
  end

  describe "release_seats" do
    before (:each) do
      @event = FactoryGirl.create(:event)
      @order = FactoryGirl.create(:order, event: @event)
      @sec = FactoryGirl.create(:event_section, event:@event)
      @seat1 = FactoryGirl.create(:event_seat, status: EventSeat::Status::RESERVED, order: @order, event_section: @sec)
      @seat2 = FactoryGirl.create(:event_seat, status: EventSeat::Status::RESERVED, order: @order, event_section: @sec)
      @seat3 = FactoryGirl.create(:event_seat, status: EventSeat::Status::RESERVED, order: @order, event_section: @sec)
    end
    
    it "should set all the seats to reserved" do
      @seats = EventSeat.all
      @seats.each { |seat|
        seat.status.should == EventSeat::Status::RESERVED
      }
      @order.release_seats().should == true
      @seats2 = EventSeat.all
      @seats2.each { |seat|
        seat.status.should == EventSeat::Status::UNSOLD
      }
    end

    it "should return false with a seat marked sold or unsold" do
      @seat4 = FactoryGirl.create(:event_seat, status: EventSeat::Status::SOLD, order: @order, event_section: @sec)
      @seats = EventSeat.all
      @order.release_seats().should == false
      @seat4.status = EventSeat::Status::UNSOLD
      @seat4.save()
      @seats = EventSeat.all
      @order.release_seats().should == false
    end
  end

  describe "find_seats" do 
    before(:each) do
      @venue = FactoryGirl.create(:venue)
      @sec = FactoryGirl.create(:section, venue: @venue)
      rows = 0..9
      columns = 0..9
      rows.each do |r|
        columns.each do |c|
          FactoryGirl.create(:seat, section: @sec, quality: 1, row: r, column: c)
        end
      end
      @e = FactoryGirl.create(:event, venue: @venue, promoter: @promoter)  
      #@e.generate_groups()
    end

    it "should return a set of seats that are reserved" do
      EventSection.all.size.should == 1
      EventSeat.all.size.should == 100
      @groups = Group.all
      @groups.size.should == 10 
      @order = FactoryGirl.build(:order, event: @e)
      seats = @order.find_seats(4).event_seats
      seats.size.should == 4
      columns = []
      seats.each do |seat|
        columns << seat.column
      end
      columns.size.should == 4
      value = columns.first
      columns.each do |column|
        column.should == value
        value += 1
      end
    end
  end
end
