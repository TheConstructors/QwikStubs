Event.delete_all
Seat.delete_all
Section.delete_all
Venue.delete_all
User.delete_all
User.create!({:full_name=>"Jared Roesch", :email=>"roeschinc@gmail.com", :password=>"pass123"})
User.create!({:full_name=>"Kyle Jorgenson", :email=>"tobe@email.com", :password=>"pass123"})
User.create!({:full_name=>"Alex Hamstra", :email=>"hamsterman@foo.com", :password=>"pass123"})

Dir[Rails.root.join("db/seed_venue*.rb")].each {|f| require f}

Dir[Rails.root.join("db/seed_event*.rb")].each {|f| require f}
