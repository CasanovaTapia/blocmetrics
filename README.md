## Blocmetrics

Created with [Bloc](http://bloc.io)
View it [here](http://ct-blocmetrics.herokuapp.com)

Paste the snippet to your application.js file to track page visits.

var blocmetrics = function(title, domain, count, visitor_email, unique_key) {
  var _bm_event = {
    name: title,
    location: domain,
    property_1: count,
    property_2: visitor_email,
    user_key: unique_key
  }

  var _bm_request = $.ajax({
      url: "http://localhost:3001/events",
      method: "post",
      data: {event: _bm_event}
  })
};


Paste the snippet below to the bottom of the view file for pages you want to track. Make sure you insert the correct user_key as a string, shown on your Blocmetrics dashboard.:
<script>
    $(document).ready(function(){
      blocmetrics("page visit", window.location.origin, 1, "<%= current_user.email %>", "user_key");
    })
</script>
