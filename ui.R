library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Comparing Rice Strain Traits by Region"),
  
  # Some helpful information
  helpText("This interactive application allows the comparison of various traits",
           "from the rice phenotype dataset. Changing region changes the origin of",
           "the strain of rice. Selecting the two variables plots them on the X",
           "and Y axis respectively. Finally, to add an additional dimension of",
           "analysis, a color fill is chosen to represent the gradient of a third",
           "variable in relation to the X and Y axes." ),
  
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
      ),
      radioButtons("Color_fill", #the input variable that the value will go into color aes
                  "Choose the color variable:",
                  c("Amylose_content","Leaf_pubescence")
      )
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
))