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
      helpText("Github Repository:"),
      helpText("https://github.com/rafaelespericueta/bivariate_normal_explorer"),
      hr()
    ),
    
    # Show Bivariate Distribution
    mainPanel(
      plotOutput("plot")
    )
  )
)