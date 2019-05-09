library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Iris Data"),
  
  # Some helpful information
  helpText("This application creates a boxplot to show difference between",
           "iris species.  Please use the radio box below to choose a trait",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      selectInput("Region", #the input variable that the value will go into
                   "Choose a region to explore:",
                   c("Europe","E Asia","S Asia","Pacific","Mid East","America","SE Asia","Africa","C Asia")
      ),
      selectInput("X_Axis", #the input variable that the value will go into
                  "Choose a variable:",
                  c("Flag_leaf_length","Panicle_length","Seed_length","Seed_volume")
      ),
      selectInput("Y_Axis", #the input variable that the value will go into
                  "Choose another variable:",
                  c("Alkali_spreading_value","Protein_content","Blast_resistance","Alu.Tol")
      )
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
))