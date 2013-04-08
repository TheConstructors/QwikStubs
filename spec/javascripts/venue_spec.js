describe("Venue index", function(){  
  it("should recieve a list of venues", function(){    
    venues = new Qwikstubs.Collections.Venues();
    expect(venues.length).toBe(0);
    var result;
    venues.fetch({success: function() {result = true}});
    waitsFor(function() {
      return result === true;
    }, "Did not complete fetch", 5000);
    runs(function() { 
    expect(venues.length).toBe(2);
    });

})});
