# Generated at 2013-02-18 22:20:59 -0800 by 'db/gen_seeds.rb'.
Seat.delete_all
Section.delete_all
Venue.delete_all
User.delete_all
User.create!({:full_name=>"Jared Roesch", :email=>"roeschinc@gmail.com", :password=>"pass123"})
User.create!({:full_name=>"Kyle Jorgenson", :email=>"tobe@email.com", :password=>"pass123"})
User.create!({:full_name=>"Alex Hamstra", :email=>"hamsterman@foo.com", :password=>"pass123"})
@v = Venue.create!({:name=>"IV Theater", :city=>"Isla Vista", :state=>"California"})
@sec = Section.create!({:name=>"A", :xpos=>10, :ypos=>10, venue:@v})
@seat = Seat.create!({:name=>"1", :column=>1, :row=>1, :xpos=>0, :ypos=>0, section:@sec})
#@seat.section = @sec
#@seat.save()
