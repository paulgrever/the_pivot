$(document).ready(function() {
    if(window.location.pathname === '/graph/index') {
            runAjaxRev();
            runAjaxUnits();
            $("#revTitle").click(function() {
                draw(revData);
            });
            $("#unitsTitle").click(function() {
                updateData(unitsData);
            });
    };
});

var revData;
var unitsData;

function runAjaxRev() {
    $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: "data_revenue",
           dataType: "json",
           success: function (data) {
               revData = data;
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
               unitsData = data;
           },
           error: function (result) {
               error(result);
           }
       });
}

var margin = {top: 30, right: 100, bottom: 50, left: 50};
var color = d3.scale.category20b();
var width = 800 - margin.left - margin.right,
    barHeight = 30;

function draw(data) {
    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data.numbers)]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .ticks(10, "$")
        .orient("bottom");

    var chart = d3.select(".graph")
        .attr("width", width + margin.left + margin.right)
        .attr("height", barHeight * data.numbers.length + 100);

    var bar = chart.selectAll("g")
        .data(data.numbers)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });

    bar.append("rect")
        .style("fill", function (d) {
                   return color(d)
               })
        .attr("width", 0)
        .transition().duration(3000)
        .attr("width", function(d,i) { return x(data.numbers[i])})
        .attr("height", barHeight - 1);

    bar.append("text")
        .style("fill", "#649d81")
        .attr("x", 0)
        .transition().duration(3000)
        .attr("x", function(d,i) {
            return x(data.numbers[i]);
        })
        .attr("y", barHeight / 2)
        .attr("dy", ".5em")
        .text(function (d, i) {
                  return data.item[i];
              });

    chart.append("g")
      .attr("class", "x axis")
      .attr("transform", function (d, i) {
                  return "translate(0," + (data.numbers.length * barHeight) + ")";
              })
      .call(xAxis);
}

function updateData(data) {
    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data.numbers)]);
    var xAxis = d3.svg.axis()
        .scale(x)
        .ticks(10, "")
        .orient("bottom");
    var chart = d3.select(".graph").transition()
        .duration(3000);

    chart.selectAll("rect")
        .duration(3000)
        .ease("linear")
        .attr("width", function(d,i) { return x(data.numbers[i]) })
        .attr("height", barHeight - 1)
        .style("fill", function (d) {
                   return color(d)
               });

    chart.selectAll("text")
        .duration(3000)
        .ease("linear")
        .attr("x", function(d,i) { return x(data.numbers[i]); })
        .attr("y", barHeight / 2)
        .attr("dy", ".5em")
        .style("fill", "#649d81")
        .text(function (d, i) { return data.item[i]; });

    chart.select(".x.axis")
      .attr("transform", function (d, i) {
                return "translate(0," +
                (data.numbers.length * barHeight) + ")";
        })
      .call(xAxis);
}


function error(e) {
    console.log("error", e)
}
