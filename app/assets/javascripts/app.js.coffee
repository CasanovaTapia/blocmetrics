jQuery ->
  data = {
    labels : ["January","February","March","April","May","June","July"],
    datasets : [
      {
        fillColor : "rgba(220,220,220,0.5)",
        strokeColor : "rgba(220,220,220,1)",
        pointColor : "rgba(220,220,220,1)",
        pointStrokeColor : "#fff",
        data : [ 50, 17, 87, 20, 46, 72, 63 ]
      },
    ]
  }

  myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Line(data)
