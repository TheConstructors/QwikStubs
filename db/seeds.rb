Group.delete_all
Order.delete_all
EventSeat.delete_all
EventSection.delete_all
Event.delete_all
Seat.delete_all
Section.delete_all
Venue.delete_all
User.delete_all
Email.delete_all

jared = User.create!({:full_name=>"Jared Roesch", :email=>"roeschinc@gmail.com", :password=>"pass123"})
Email.create!(email: jared.email, user: jared)

kyle  = User.create!({:full_name=>"Kyle Jorgensen", :email=>"tobe@email.com", :password=>"pass123"})
Email.create!(email: kyle.email, user: kyle)

alex  = User.create!({:full_name=>"Alex Hamstra", :email=>"hamsterman@foo.com", :password=>"pass123"})
Email.create!(email: alex.email, user: alex)


Dir[Rails.root.join("db/seed_venue*.rb")].each {|f| require f}

Dir[Rails.root.join("db/seed_event*.rb")].each {|f| require f}

Dir[Rails.root.join("db/seed_order*.rb")].each {|f| require f}
