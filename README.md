## Blocmetrics

Created with [Bloc](http://bloc.io)
View it [here](http://ct-blocmetrics.herokuapp.com)

Paste the snippet to your application.js file to track page visits:

<script>
    $(document).ready(function(){
      var _bm_event = {
        name: "page_visit",
        location: "http://ct-blocmarks.herokuapp.com",
        property_1: 1,
        property_2: "property you want to receive"
      }

      var _bm_request = $.ajax({
          url: "http://localhost:3001/events",
          method: "post",
          data: {event: _bm_event}
      })

    })
</script>
