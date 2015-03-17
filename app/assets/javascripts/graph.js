$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'data',
           dataType: 'json',
           success: function (data) {
               draw(data);
           },
           error: function (result) {
               error();
           }
       });

function draw(data) {
    var color = d3.scale.category20b();
    var width = 900,
        barHeight = 50;

    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data.revenue)]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .ticks(10, "$")
        .orient("bottom");

    var chart = d3.select(".graph")
        .attr("width", width)
        .attr("height", barHeight * data.revenue.length);

    var bar = chart.selectAll("g")
        .data(data.revenue)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });

    bar.append("rect")
        .attr("width", x)
        .attr("height", barHeight - 1)
        .style("fill", function (d) {
                   return color(d)
               });

    bar.append("text")
        .attr("x", 25)
        .attr("y", barHeight / 2)
        .attr("dy", ".5em")
        .style("fill", "white")
        .text(function (d, i) {
                  return data.item[i];
              });

    chart.append("g")
      .attr("class", "x axis")
      .call(xAxis);
}

function error() {
    console.log("error")
}
