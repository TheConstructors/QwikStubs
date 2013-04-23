describe "Event index", ->
  it "should recieve a list of events", ->
    venues = new Qwikstubs.Collections.Events();
    expect(venues.length).toBe(0);
    result = false;
    venues.fetch({success: ->
      result = true })
    waitsFor ->
      result == true
    runs ->
      expect(venues.length).toBe(4);
        
    