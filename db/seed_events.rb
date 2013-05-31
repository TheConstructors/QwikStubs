@venue = Venue.find_by_name("The Constructors Arena")
@campbell = Venue.find_by_name("UCSB Campbell Hall")

# Event.create!({:name=>"Young the Giant", :month=>"Apr", :day=>"25", :year=>"2013", :time=>"7:00pm", :venue=>@campbell, 
#   :description=>"Young the Giant, a band based out of Irvine, CA, travels across the seven continents on their first World Tour."})

# Event.create!({:name=>"Jared and the Pussycats", :month=>"Apr", :day=>"24", :year=>"2013", :time=>"1:00pm", :venue=>@campbell, 
#   :description=>"Jared Roesch debuts his new music for the 2013 season by playing with actual, LIVE cats!"})
  
# Event.create!({:name=>"The Beatles", :month=>"Apr", :day=>"25", :year=>"2013", :time=>"10:00pm", :venue=>@campbell, 
#     :description=>"They did it with Tupac and now you can see The Beatles in hologram form playing the hits you know and love."})
# Event.create!({:name=>"Gauchella", :month=>"Apr", :day=>"27", :year=>"2013", :time=>"All Day", :venue=>@campbell,
#   :description=>"In it's debut, Gauchella is predicted to be Santa Barbara's most successful music festival to date, bringing together people from all walks of life for one thing -- a love of music.  With over 20 bands from all over the world slated to appear, festival-goers are in for a day that they won't soon forget."})            
# Event.create!({:name=>"Alex Against the Machine", :month=>"Apr", :day=>"28", :year=>"2013", :time=>"1:00pm", :venue=>@campbell,
#   :description=>"In this inspiring new art form, Alex Hamstra takes a baseball bat to all of his least favorite machines."})
# Event.create!({:name=>"Bruin Music Festival", :month=>"May", :day=>"27", :year=>"2013", :time=>"All Day", :venue=>@campbell,
#   :description=>"A music festival in Los Angeles specifically for UCLA Students."})
 Event.create!({:name=>"Ben and the Boo Boo Bears", :month=>"Jun", :day=>"14", :year=>"2013", :time=>"1:00pm", :venue=>@campbell,
   :description=>"In this not creepy at all kid's show, Ben McCurdy wins the hearts of kids and parents nationwide."})
# Event.create!({:name=>"The Kyle Project", :month=>"Jul", :day=>"12", :year=>"2013", :time=>"1:00pm", :venue=>@campbell,
#   :description=>"Kyle sings so quietly so make sure to bring your hearing aids folks."})
# Event.create!({:name=>"Computer Science: The Musical", :month=>"Jul", :day=>"31", :year=>"2013", :time=>"7:00pm", :venue=>@campbell, 
#   :description=>"See Stratos Dimopoulous in his Broadway Debut as Stratos in Computer Science: the Musical! Written and Scored by Jared Roesch."})
# Event.create!({:name=>"Macklemore & Ryan Lewis", :month=>"Aug", :day=>"12", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"Macklemore & Ryan Lewis Summer Tour 2013"})
# Event.create!({:name=>"One Direction", :month=>"Aug", :day=>"13", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"You will be able to hear the adolescent screams all the way from your house."})
# Event.create!({:name=>"Bruno Mars", :month=>"Sep", :day=>"22", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"Easy come, easy go, that's not how these tickets are OH! Take, take, take it all, but first...give us your money for Bruno Mar's 2013 World Tour."})
# Event.create!({:name=>"Taylor Swift", :month=>"Oct", :day=>"19", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"She knew you were trouble when you walked in, so buy tickets for Taylor Swift's Fall 2013 Concert and listen to her sing songs about it."})
# Event.create!({:name=>"Justin Timberlake", :month=>"Oct", :day=>"21", :year=>"2013", :time=>"8:00pm", :venue=>@campbell, 
#     :description=>"Come on out in your suits and ties because we're gonna leave it all on the floor tonight for JT's COMEBACK TOUR!"})
# Event.create!({:name=>"Deadmau5", :month=>"Nov", :day=>"01", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"Watch Deadmau5 spin those tracks all night long!"})
# Event.create!({:name=>"Miley Cyrus", :month=>"Nov", :day=>"03", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"Because she can't be tamed ya'll better by some tickets for her Hannah Montana Tour, ya hear?"})
# @event = Event.create!({:name=>"Imagine Dragons", :month=>"Nov", :day=>"11", :year=>"2013", :time=>"9:00pm", :venue=>@campbell, 
#     :description=>"Imagine Dragons travels to 25 cities on their Radioactive 2013 Tour."})
    
# # Event orders for Imagine Dragons
# samples = 1..30

# samples.each do |n|
#   Order.create!({:order_number=>n, :total_amount=>111.51, event: @event})

# end


# End event orders



# samples = 10..30
# 
# samples.each do |n|
#   Event.create!({:name=>"Some Concert #{n}", 
#                 :month=>"Apr", :day=>"#{n}", :year=>"2013", :time=>"1:00pm", 
#                 :venue=>@campbell,
#                 :description=>"Fake Event #{n} for testing pagination."})
# end 
# samples.each do |n|
#   Event.create!({:name=>"Some Festival #{n+30}", 
#                 :month=>"May", :day=>"#{n}", :year=>"2013", :time=>"1:00pm", 
#                 :venue=>@campbell,
#                 :description=>"Fake Event #{n+30} for testing pagination."})
# end 
