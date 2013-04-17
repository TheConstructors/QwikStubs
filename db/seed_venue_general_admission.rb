@gen_ad = Venue.create!({:name=>"The Constructors Arena", :city=>"Goleta", :state=>"CA"})

@gen_ad_section = Section.create!({:name=>"General Admission", :venue=>@gen_ad})

100.times do
  Seat.create!({:name=>"Ticket", :section=>@gen_ad_section})
end