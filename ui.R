#
# ui.R (for a shiny app)
#
# Developing Data Products Course Project
# by Rafael Espericueta

fluidPage(
  # Application title
  titlePanel("Bivariate Normal Distribution Explorer"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      sliderInput("N",
                  "Number samples:",
                  min = 3,  max = 10000, value = 500),
      sliderInput("Sx",
                  "Standard deviation for x:",
                  min = 1,  max = 30,  value = 5),
      sliderInput("Sy",
                  "Standard deviation for y:",
                  min = 1,  max = 30,  value = 3),
      sliderInput("r",
                  "Correlation of x and y:",
                  min = 0,  max = 0.99,  value = 0.5),
      hr(),
      helpText("Use the above sliders to set the number of samples N, the standard deviations Sx and Sy, and the correlation of x and y. "),
      helpText("The result: a plot of a bivariate normal sample chosen from the specified distribution."),
      hr(),
      helpText("To see a slidify presentation of this explorer, visit:"),
      helpText(a("     Slide Presentation", href="http://rpubs.com/mathprof/80692")),
      hr(),
      helpText("To see the source code, visit the project's Github Repository:"),
      helpText(a("     Github Repo", href="http://github.com/rafaelespericueta/bivariate_normal_explorer"))
    ),
    
    # Show Bivariate Distribution
    mainPanel(
      plotOutput("plot",  width = "100%")
    )
  )
)