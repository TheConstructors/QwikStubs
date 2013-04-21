@venue = Venue.find_by_name("UCSB Campbell Hall")

Event.create!({:name=>"Jared and the Pussycats", :month=>"Feb", :day=>"26", :year=>"2014", :time=>"1:00pm", :venue=>@venue,
              :description=>"Jared Roesch debuts his new music for the 2014 season by playing with actual, LIVE cats!"})
Event.create!({:name=>"Alex Against the Machine", :month=>"May", :day=>"28", :year=>"2014", :time=>"1:00pm", :venue=>@venue,
              :description=>"In this inspiring new art form, Alex Hamstra takes a baseball bat to all of his least favorite machines."})
Event.create!({:name=>"Ben and the Boo Boo Bears", :month=>"Jan", :day=>"14", :year=>"2014", :time=>"1:00pm", :venue=>@venue,
              :description=>"In this not creepy at all kid's show, Ben McCurdy wins the hearts of kids and parents nationwide."})
Event.create!({:name=>"The Kyle Project", :month=>"Jul", :day=>"12", :year=>"2014", :time=>"1:00pm", :venue=>@venue,
              :description=>"Kyle sings so quietly so make sure to bring your hearing aids folks.  Kyle sings so quietly so make sure to bring your hearing aids folks."})

@venue = Venue.find_by_name("The Constructors Arena")

samples = 1..30

samples.each do |n|
  Event.create!({:name=>"The Pagina Monologues #{n}", 
                :month=>"April", :day=>"#{n}", :year=>"2013", :time=>"1:00pm", 
                :venue=>@venue,
                :description=>"Fake Event #{n} for testing pagination."})
end 
samples.each do |n|
  Event.create!({:name=>"The Pagina Monologues #{n+30}", 
                :month=>"May", :day=>"#{n}", :year=>"2013", :time=>"1:00pm", 
                :venue=>@venue,
                :description=>"Fake Event #{n+30} for testing pagination."})
end 