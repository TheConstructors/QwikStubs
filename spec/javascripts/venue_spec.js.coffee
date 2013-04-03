  describe "Venue index", ->
    it "should recieve a list of venues", ->
      venue = new Qwikstubs.Views.VenuesIndex
      expect(venue.length).toBe(0)