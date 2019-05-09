#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)

iris_long <-gather(iris, key = "Trait", value = "Measurement", Sepal.Length:Petal.Width)
#head(iris_long)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl <- 
      iris_long %>%
      filter(Species == input$Species) %>%
      ggplot(#Use aes_string below so that input$trait is interpreted
             #correctly.  The other variables need to be quoted
                 aes_string(x="Trait",
                            y="Measurement",
                            fill="Trait"
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
})