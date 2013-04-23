describe "Venue index", ->
  it "should recieve a list of venues", ->
    venues = new Qwikstubs.Collections.Venues();
    expect(venues.length).toBe(0);
    result = false;
    venues.fetch({success: ->
      result = true })
    waitsFor ->
      result == true
    runs ->
      expect(venues.length).toBe(2);
        
    