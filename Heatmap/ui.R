
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("New Application"),
  sidebarLayout(
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    textInput("genes",
              label="genes list", 
              value="DUSP1,TP53,RUNX1"
               ),
    actionButton("action", label = "Submit"),
    br(),
    checkboxGroupInput(inputId="cluster",label="Clustering",choices=c("row","column"),selected=c("row","column"),inline=TRUE),
    checkboxGroupInput(inputId="leu",label="Patient selector",choices=list("Ozar" = "OZAR","Magi" = "MAGI","Jara" = "JARA","Frla" = "FRLA"),selected=c("OZAR","MAGI","JARA","FRLA"),inline=TRUE),
    sliderInput(inputId="colors",label="Number of color levels",min=3,max=12,value=9,step=1,width=600),
    hr(),
    fluidRow(column(12, verbatimTextOutput("value")))
    
  ),

  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("map"),
    plotOutput("distPlot"),
    textOutput("text1")
    
  ))
))
