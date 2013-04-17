@gen_ad = Venue.create!({:name=>"The Constructors Arena", :city=>"Goleta", :state=>"CA"})

@gen_ad_section = Section.create!({:name=>"General Admission", :venue=>@gen_ad})

seats = 1..100

seats.each do |n|
  Seat.create!({:name=>"Ticket#{n}", :section=>@gen_ad_section})
end