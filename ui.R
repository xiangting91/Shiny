library(shiny)
shinyUI(pageWithSidebar(
        headerPanel('Developing Data Products - Course Project'),
        sidebarPanel(
                h3('Instructions'),
                p('Enter the gross horsepower, number of cylinders, weight of your 
                car  and transmission type below.  The predicted MPG will be shown to the right.'),
                h3('Please enter predictors of MPG below.'),
                numericInput('hp', 'Gross horsepower:', 140, min = 50, max = 330, step = 10), # example of numeric input
                radioButtons('cyl', 'Number of cylinders:', c('4' = 4, '6' = 6, '8' = 8), selected = '4'), # example of radio button input
                numericInput('wt', 'Weight (lbs):', 3200, min = 1500, max = 5500, step = 100),
                radioButtons('am', 'Transmission:', c('Automatic = 0' = 0, 'Manual = 1' = 1), selected = 'Automatic = 0')
        ),
        mainPanel(
                h6('Course Project'),
                h3('Predicted MPG'),
                h4('You entered:'),
                verbatimTextOutput("inputValues"),
                h4('Which resulted in a prediction of:'),
                verbatimTextOutput("prediction"),
                h4('MPG relative to cars in mtcars data set'),
                plotOutput('plots'),
                h3('Method'),
                p('This app uses the mtcars dataset and allows users to predict Miles per gallon (MPG) using 4 variables - orsepower, number of cylinders, weight and transmission (Automactic or Manual)
                This is done through fitting a linear model on these 4 variables.  The radio buttons choices are use to limit inputs of number of cyliners and transmission to the valid inputs.  For the weight,
                reactive() is used to convert the user input weight into the units 
                used by the model, lb/1000. Inputs of the users are shown for validation. Finally, the linear model function is used to predict the mpg based on the 4 variables 
                input by the user.MPG is recalculated and displayed each time user changes a variable. ')
                )
        ))