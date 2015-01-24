---
title       : Roadkill Observation Visualization
subtitle    : 
author      : Chiu Wei Chieh
job         : Interactive Designer
framework   : revealjs        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Taiwan Roadkill Observation Visualization

Chiu Wei Chieh  

--- 


## Why

To save beautiful animals like this Chinese leopard cat!  
![Chinese leopard cat](./assets/img/Chinese leopard cat.jpg)   

---

## How

[Taiwan Roadkill Observation Network](http://roadkill.tw/) has been collect and document roadkill data for many years. These data can be used to raise awareness of conservation and help government making better regulations.  

The data can be found on [data.gov.tw](http://data.gov.tw/node/8338).

---

## What

In this project, I use the data to create visualization to help people to understand how many animals were killed on the road and where did it happend. The visualization includes  

- Interactive maps  
- Interactive charts  

<a href="http://licaschiou.shinyapps.io/Roadkill/" target="_blank">The app can be found here.</a>

---

## Example 1 

<!-- PieChart generated in R 3.1.1 by googleVis 0.5.8 package -->
<!-- Sat Jan 24 14:05:19 2015 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataPieChartID110c734c1c61 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "10",
110 
],
[
 "11",
162 
],
[
 "12",
206 
] 
];
data.addColumn('string','x');
data.addColumn('number','freq');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartPieChartID110c734c1c61() {
var data = gvisDataPieChartID110c734c1c61();
var options = {};
options["allowHtml"] = true;
options["title"] = "Roadkill percentage by Month";
options["height"] =    480;

    var chart = new google.visualization.PieChart(
    document.getElementById('PieChartID110c734c1c61')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartPieChartID110c734c1c61);
})();
function displayChartPieChartID110c734c1c61() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartPieChartID110c734c1c61"></script>
 
<!-- divChart -->
  
<div id="PieChartID110c734c1c61" 
  style="width: 100%; height: 480;">
</div>

---

## Example 2 

<!-- BarChart generated in R 3.1.1 by googleVis 0.5.8 package -->
<!-- Sat Jan 24 14:09:10 2015 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataBarChartID110c7aa25c46 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Changhua County",
10 
],
[
 "Chiayi City",
2 
],
[
 "Chiayi County",
200 
],
[
 "Hsinchu County",
11 
],
[
 "Hualien County",
3 
],
[
 "Kaohsiung County",
6 
],
[
 "Kinmen County",
3 
],
[
 "Miaoli County",
6 
],
[
 "Nantou County",
25 
],
[
 "New Taipei City",
9 
],
[
 "PenghuCounty",
1 
],
[
 "Pingtung County",
21 
],
[
 "Taichung City",
9 
],
[
 "Tainan City",
82 
],
[
 "Taipei City",
7 
],
[
 "Taitung County",
56 
],
[
 "Taoyuan County",
4 
],
[
 "Yilan County",
2 
],
[
 "Yunlin County",
21 
] 
];
data.addColumn('string','county');
data.addColumn('number','kill counts');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartBarChartID110c7aa25c46() {
var data = gvisDataBarChartID110c7aa25c46();
var options = {};
options["allowHtml"] = true;
options["title"] = "Roadkill percentage by county";
options["height"] =    480;

    var chart = new google.visualization.BarChart(
    document.getElementById('BarChartID110c7aa25c46')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartBarChartID110c7aa25c46);
})();
function displayChartBarChartID110c7aa25c46() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartBarChartID110c7aa25c46"></script>
 
<!-- divChart -->
  
<div id="BarChartID110c7aa25c46" 
  style="width: 100%; height: 480;">
</div>

---

## Acknowledgements

[slidify](http://ramnathv.github.io/slidify/)  
[googleVis](https://developers.google.com/chart/interactive/docs/reference)  

---

## Thanks for watching !


