require 'spec_helper'

describe Promoter do
 it "should have a name" do
    @promoter = Promoter.new(name:"Kyle Jorgensen, Inc.")

    @promoter.name.should == "Kyle Jorgensen, Inc."
    end

end
