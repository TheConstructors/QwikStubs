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
Seat.create!({:name=>"1", :column=>1, :row=>1, :xpos=>1, :ypos=>1, section:@sec})
Seat.create!({:name=>"2", :column=>1, :row=>1, :xpos=>2, :ypos=>2, section:@sec})
Seat.create!({:name=>"3", :column=>1, :row=>1, :xpos=>3, :ypos=>3, section:@sec})
Seat.create!({:name=>"4", :column=>1, :row=>1, :xpos=>4, :ypos=>4, section:@sec})
Seat.create!({:name=>"5", :column=>1, :row=>1, :xpos=>5, :ypos=>5, section:@sec})
Seat.create!({:name=>"6", :column=>1, :row=>1, :xpos=>6, :ypos=>6, section:@sec})
Seat.create!({:name=>"7", :column=>1, :row=>1, :xpos=>7, :ypos=>7, section:@sec})
Seat.create!({:name=>"8", :column=>1, :row=>1, :xpos=>8, :ypos=>8, section:@sec})
