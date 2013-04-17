@venue = Venue.find_by_name("UCSB Campbell Hall")

Event.create!({:name=>"Jared and the Pussycats", :date=>"2/26/2014", :time=>"1:00pm", :venue=>@venue})
Event.create!({:name=>"Alex Against the Machine", :date=>"5/14/2014", :time=>"1:00pm", :venue=>@venue})
Event.create!({:name=>"Ben and the Boo Boo Bears", :date=>"1/26/2014", :time=>"1:00pm", :venue=>@venue})
Event.create!({:name=>"The Kyle Project", :date=>"7/26/2014", :time=>"1:00pm", :venue=>@venue})
