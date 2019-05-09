library(shiny)
library(ggplot2)
library(readr)

rice_data <- read_csv("RiceDiversity.44K.MSU6.Phenotypes.csv")
colnames(rice_data) <- gsub(" ", "_", colnames(rice_data))

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
      rice_data %>%
      filter(Region == input$Region) %>%
      ggplot(
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x=input$X_Axis,
                            y=input$Y_Axis,
                            color="Amylose_content")
                 )
    
    
    # draw the boxplot for the specified trait
    pl + geom_point()
  })
})