
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
library(shiny)
library(Biobase)
library(pheatmap)
library(limma)
library(RColorBrewer)

all <- readRDS("data/ALL.rds")
source("helpers.R")


shinyServer(function(input, output) {
  output$map <-renderPlot({
   heat(var=all,ids=clean(input$genes),ncolor=input$colors,leu=input$leu)
  })
  output$value <- renderPrint({ input$leu })
  #output$text1 <- renderText({paste("selected genes", clean(input$genes))})
  output$text1 <- renderText({clean(input$genes)})
})
