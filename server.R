library(shiny)
data(mtcars)

modelFit <- lm(mpg ~ hp + cyl + wt +am, data=mtcars)

mpg <- function(hp, cyl, wt, am) {
        modelFit$coefficients[1] + modelFit$coefficients[2] * hp + 
                modelFit$coefficients[3] * cyl + modelFit$coefficients[4] * wt + modelFit$coefficients[5] * am
}

shinyServer(
        function(input, output) {
                adjusted_weight <- reactive({input$wt/1000})
                predicted_mpg <- reactive({mpg(input$hp, as.numeric(input$cyl), adjusted_weight(), as.numeric(input$am))})
                output$inputValues <- renderPrint({paste(input$cyl, "cylinders, ",
                                                         input$hp, "horsepower, ",
                                                         input$wt, "lbs",
                                                         input$am, "transmission"
                                                         )})
                output$prediction <- renderPrint({paste(round(predicted_mpg(), 2), "miles per gallon")})
                output$plots <- renderPlot({
                        par(mfrow = c(1, 4))
                        # (1, 1)
                        with(mtcars, plot(hp, mpg,
                                          xlab='Gross horsepower',
                                          ylab='MPG',
                                          main='MPG vs horsepower'))
                        points(input$hp, predicted_mpg(), col='red', cex=3)                 
                        # (1, 2)
                        with(mtcars, plot(cyl, mpg,
                                          xlab='Number of cylinders',
                                          ylab='MPG',
                                          main='MPG vs cylinders'))
                        points(as.numeric(input$cyl), predicted_mpg(), col='red', cex=3)  
                        # (1, 3)
                        with(mtcars, plot(wt, mpg,
                                          xlab='Weight (lb/1000)',
                                          ylab='MPG',
                                          main='MPG vs weight'))
                        points(adjusted_weight(), predicted_mpg(), col='red', cex=3)
                        # (1, 4)
                        with(mtcars, plot(am, mpg,
                                          xlab='Transmission (Automactic or Manual)',
                                          ylab='MPG',
                                          main='MPG vs Transmission'))
                        points(adjusted_weight(), predicted_mpg(), col='red', cex=3)  
                })
        }
)