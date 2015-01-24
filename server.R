library(googleVis)
library(shiny)
library(rCharts)
library(ggplot2)
library(plyr)

roadKill <- read.csv("./data/tidyRoadKill.csv")

mapWidth <- 960
mapHeight <- 800
map <- Leaflet$new()
map$setView(c(23.727764, 119.950035), zoom = 8)
map$tileLayer(provider = 'OpenStreetMap.Mapnik')
map$set(width = mapWidth, height = mapHeight)

nrowRoadKill <- nrow(roadKill)
countFamily <- count(roadKill$FamilyCommon)
countCounty <- count(roadKill$engCounty)

shinyServer(function(input, output, session){
  
  output$chart1 <- renderGvis({    
    gvisBarChart(countFamily, options=list(
      title="Roadkill counts by Family",
      width="100%", height=800))
  })
  
  output$chart2 <- renderGvis({    
    gvisBarChart(countCounty, options=list(
      title="Roadkill counts by County",
      width="100%", height=800))
  })
  
  output$chart3 <- renderGvis({    
    gvisPieChart(countCounty, options=list(
      title="Roadkill percentage by county",
      width="50%", height=800))
  }) 
  
  output$myMap <- renderMap({
    # reset map
    map <- Leaflet$new()
    map$setView(c(23.727764, 119.950035), zoom = 8)
    map$tileLayer(provider = 'OpenStreetMap.Mapnik')
    map$set(width = mapWidth, height = mapHeight)
    # get input
    from <- as.POSIXct(input$daterange[1])
    to <- as.POSIXct(input$daterange[2])
    familyToShow <- input$Family
    countyToShow <- input$County
    # filter data
    if(familyToShow == "All"){
      for(i in 1:nrowRoadKill){
        current <- as.POSIXct(roadKill$date[i])
        location <- as.character(roadKill$engCounty[i])
        if(countyToShow == "All"){
          location <- countyToShow
        }
        if(location == countyToShow){
          if((current >= from) && (current <= to)){
            map$marker(
              c(roadKill$WGS84Lat[i], roadKill$WGS84Lon[i]),
              bindPopup = roadKill$FamilyCommon[i]
            )          
          }
        }
        
      }
    }
    else{
      for(i in 1:nrowRoadKill){
        current <- as.POSIXct(roadKill$date[i])
        location <- as.character(roadKill$engCounty[i])
        if(countyToShow == "All"){
          location <- countyToShow
        }
        if(location == countyToShow){
          if((current >= from) && (current <= to)){
            commonName <- as.character(roadKill$FamilyCommon[i])
            if(commonName == familyToShow){
              map$marker(
                c(roadKill$WGS84Lat[i], roadKill$WGS84Lon[i]),
                bindPopup = roadKill$FamilyCommon[i]
              )  
            }  
          }
        }
      }
    }  
    
    map
  })
  
  
})