$(document).ready(function() {
    if(window.location.pathname === '/graph/index') {
            runAjaxRev();
            runAjaxUnits();
    };

    $("#rev").click(function() {
        draw(rev_data);
    });

    //$("#units").click(function() {
        //draw(units_data);
    //});

});

var rev_data
var units_data

function runAjaxRev() {
    $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: "data_revenue",
           dataType: "json",
           success: function (data) {
               rev_data = data;
           },
           error: function (result) {
               error(result);
           }
       });
}

function runAjaxUnits() {
    $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: "data_units",
           dataType: "json",
           success: function (data) {
               units_data = data;
           },
           error: function (result) {
               error(result);
           }
       });
}


function draw(data) {
    var color = d3.scale.category20b();
    var width = 800,
        barHeight = 50;

    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data.numbers)]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .ticks(10, "&nbsp;")
        .orient("bottom");

    var chart = d3.select(".graph")
        .attr("width", width)
        .attr("height", barHeight * data.numbers.length + 100);

    var bar = chart.selectAll("g")
        .data(data.numbers)
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
      .attr("transform", function (d, i) {
                  return "translate(0," + (data.numbers.length * barHeight) + ")";
              })
      .call(xAxis);

    d3.select("#units")
        .on("click", function() {
            console.log("clicked");
            var graph = d3.select('.graph')
                .data(units_data)
                .attr("class", "x axis")
                .attr("transform", function (d, i) {
                return "translate(0," + (data.numbers.length * barHeight) + ")";
                })
                .call(xAxis);
            graph.selectAll("g")
                .data(units_data)
                .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
                });
            graph.selectAll("rect")
                .data(units_data)
                .attr("width", x)
                .attr("height", barHeight - 1)
                .style("fill", function (d) {
                   return color(d);
                });
            graph.selectAll("text")
                .data(units_data)
                .attr("x", 25)
                .attr("y", barHeight / 2)
                .attr("dy", ".5em")
                .style("fill", "white")
                .text(function (d, i) {
                  return data.item[i];
              });
            });
}


function error(e) {
    console.log("error", e)
}
