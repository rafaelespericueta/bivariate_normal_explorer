#
# server.R (for a shiny app)
#
# Developing Data Products
#     Course Project
#          by 
#   Rafael Espericueta

library(MASS)
library(ggplot2)

function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$N
    input$Sx
    input$Sy
    input$r
  })
  
  output$plot <- renderPlot({
    v <- terms()
    
    sxy <- input$r * input$Sx * input$Sy
    Sigma <- matrix(c(input$Sx^2, sxy, sxy, input$Sy^2), 2, 2)
    df <- data.frame(mvrnorm(n = input$N, rep(0, 2), Sigma, empirical = TRUE))
    colnames(df) <- c('x', 'y')
    
    # Find the max and min x and y coordinate to create a viewing square.
    xmin <- min(df$x);  xmax <- max(df$x)
    ymin <- min(df$y);  ymax <- max(df$y)
    square_radius <- max(abs(xmin), abs(xmax), abs(ymin), abs(ymax))
    xmin <- -square_radius;  xmax <- square_radius
    ymin <- -square_radius;  ymax <- square_radius
    
    # 2D plot of sample of bivariate random variables, 
    # along with its regression line.
    p <- ggplot(df, aes(x, y))  +
      geom_point(colour = "skyblue", size = 5) + 
      geom_point(alpha = .1) +
      xlim(xmin, xmax) + ylim(ymin, ymax) +
      coord_fixed() +            # Preserve aspect ratio
      geom_smooth(method = lm,   # Add linear regression line
                  color = 'red')
    print(p)
  }, height = 700, width = 700)
}



