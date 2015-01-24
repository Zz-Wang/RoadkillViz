library(shiny)
library(rCharts)

roadKill <- read.csv("./data/tidyRoadKill.csv")
FamilyCommonNames <- levels(as.factor(roadKill$FamilyCommon))
countyNames <- levels(as.factor(roadKill$engCounty))
nrowRoadKill <- nrow(roadKill)
startDate <- roadKill$date[nrowRoadKill]
endDate   <- roadKill$date[1]

intro1 <- HTML("<h4>Introduction</h4>Taiwan is a small island locating at the south east of mainland China. During the ice age, the sea-level retreated, so many species were able to move from the mainland to thrive here. As time goes by, they evoled into endemic species that can only be found on this island.")
intro2 <- HTML("Due to the expanding of human activity, road kill (animals which are killed on roads by cars or other vehicles) has gradually became one of the threats to the animals. <a href='http://roadkill.tw/' target='_blank'>Taiwan Roadkill Observation Network</a> is a NGO dedicating on this issue. Their volunteers collect information about each accident including date, specie, location, etc. So we can use the data to arouse the awareness of conservation and help administration making effective regulations.")
intro3 <- HTML("<h4>Method</h4>This application reads road kill data and represent the exploratory analysis by interactive map and charts. The processes are: <br><ul><li>Make tidy dataset by removing incomplete obervation.</li><li>Convert science name to common name using taxize package.</li><li>Remove columns containing UTF-8 value which cause error on deploying.</li><li>Read the new tidy dataset and visualize via rCharts and googleVis.</li></ul>")
intro4 <- HTML("<h4>Usage</h4><ul><li>Click on markers on the map to show the specie names.</li><li>Users can decide which data they want to display on the interactive map through 3 widges  <ul><li>Family : filter data by common family name.</li><li>County : filter data by location.</li><li>Date range : filter data by date</li></ul><li>Hover on the charts to show detail information.</li></li>")

# info <- paste("The data used for this project was collected between ", startDate, " to ", endDate,".", collapse = "")

info2 <- HTML("Data source : <a href='http://data.gov.tw/node/8338' target='_blank'>data.gov.tw</a><br>Read more : <a href='http://tesrieng.tesri.gov.tw/show_index.php' target='_blank'>Endemic Species Research Institute website</a>")

citing1 <- HTML("Scott Chamberlain and Eduard Szocs (2013). taxize - taxonomic search and retrieval in R. F1000Research, 2:191. URL: http://f1000research.com/articles/2-191/v2.")
citing2 <- HTML("Vaidyanathan,R. (2014), rCharts: Interactive Charts using Polycharts.js, R package version 0.4.2, github.com/ramnathv/rCharts.")
citing3 <- HTML("Markus Gesmann and Diego de Castillo. Using the Google Visualisation API with R. The R Journal, 3(2):40-44, December 2011.")



shinyUI(fluidPage(
  tags$head(
    includeCSS("./css/style.css")
  ), 
  fluidRow(    
    column(6, offset = 3, 
           titlePanel("Taiwan Roadkill Observation Visualization"),
           h4("Chiu Wei Chieh"),
           p(HTML("<hr>")),
           p(intro1),
           p(intro2),           
           p(info2),
           p(intro3),
           p(intro4)
    )
  ),
  fluidRow(id="controls",     
           column(2, offset = 3, 
                  selectInput("Family", 'Family', c("All", FamilyCommonNames))
           ),
           column(2,
                  selectInput("County", 'County', c("All", countyNames))
           ),
           column(4,
                  dateRangeInput("daterange", "Date range:",
                                 start = startDate,
                                 end   = endDate
                  )        
           )
  ),
  fluidRow(id="map",    
           column(12, align="center",
                  div(chartOutput('myMap', 'leaflet'))
           )
  ),
  fluidRow(    
    column(3, offset = 3, align="center",
           htmlOutput("chart1")
    ), 
    column(3, align="center",
              htmlOutput("chart2")
    )
  ),
  fluidRow(    
    column(12, align="center",
           htmlOutput("chart3")
    )
  ),
  fluidRow(    
    column(6, offset = 3, 
           
           h4("Citing"),
           h5("taxize"),
           p(citing1),
           h5("rCharts"),
           p(citing2),
           h5("googleVis"),
           p(citing3)
    )
  ),
  fluidRow(id="footer",        
    column(6, offset = 3, align="center",
      p(HTML("<hr>")),
      p(HTML("<a href='http://licaschiou.github.io/portfolio/' target='_blank'>2015 Chiu Wei Chieh</a>"))
    )
  )  
))
