Seat.delete_all
Section.delete_all
Venue.delete_all
User.delete_all
User.create!({:full_name=>"Jared Roesch", :password=>"pass123"})
User.create!({:full_name=>"Kyle Jorgenson", :password=>"pass123"})
User.create!({:full_name=>"Alex Hamstra", :password=>"pass123"})

Dir[Rails.root.join("db/seed_venue*.rb")].each {|f| require f}
