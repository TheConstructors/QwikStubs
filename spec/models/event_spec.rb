require 'spec_helper'

describe Event do
 
  before(:each) do
    @e = Event.create!(name:"Rock and Troll Concert", date: "1-9-14")
  end

end
