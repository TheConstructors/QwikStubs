$(document).ready(function() {
    var count;
    
    Backbone.Events.on('count:set', function(e, data) {
        count = data;
        $("#count").text(count.toString());
    });

    $('#the-button').on('click', function(e) {
        Backbone.Events.trigger('remote:count:inc');
    });
});
