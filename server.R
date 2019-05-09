library(shiny)
library(ggplot2)

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
    pl <- ggplot(data = subset(iris, Species == input$species),
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="Species",
                            y=input$species,
                            fill="Species"
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
})