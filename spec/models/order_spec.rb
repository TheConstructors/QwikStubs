require 'spec_helper'

describe Order do
  before (:each) do
    @ord = FactoryGirl.create(:order)
  end
  
  it "should have an order number" do
    @ord.order_number.should_not be_empty
  end
  
  it "should have a total amount" do
    @ord.total_amount.should == 156.10
  end
  
  it "should fail if there is no order number" do
    @no_num = Order.create(order_number: "")
    @no_num.errors[:order_number].should_not be_empty
  end
  
  it "should fail if there is no total amount" do
    @no_price = Order.create(order_number: "1234345")
    @no_price.errors[:total_amount].should_not be_empty
  end
  
  it "should have a unique order number" do
    @ord2 = Order.create(order_number: @ord.order_number, total_amount: "10.00")
    @ord2.valid?.should be_false
    @ord2.errors.should_not be_empty
  end
  
  it "should have billing info" do
    @ord.billing_info.should_not be_nil
  end
    
  
  #it "should have a random order number" do
  #end
  

end
