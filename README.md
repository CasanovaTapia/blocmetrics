## Blocmetrics

Created with [Bloc](http://bloc.io)
View it [here](http://ct-blocmetrics.herokuapp.com)

Paste the snippet to your application.js file:

var _bm_event = {
  title: "your event title"
  web_property_id: web_property_id
  created_at: created_at
}

var _bm_request = new XMLHttpRequest();
_bm_request.open("POST", "http://ct-blocmetrics.com/events.json", true);
_bm_request.setRequestHeader('Content-Type', 'application/json');
_bm_request.onreadystatechange = function() {
  // this function runs when the Ajax request changes state.
  // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
};
_bm_request.send(JSON.stringify(_bm_event));
