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
    
  describe "generateOrderNumber" do
    it "should produce 0 if there are no orders" do
      Order.stubs(:empty?).returns(true)
      Order.generateOrderNumber.should == 0
    end

    it "should produce a new unique order number" do
      @ord_num = Order.generateOrderNumber
      @ord2 = FactoryGirl.create(:order)
      @ord_num2 = Order.generateOrderNumber
      @ord_num.should < @ord_num2
    end
  end
  

end
