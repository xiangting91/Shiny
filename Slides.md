---
title       : Coursera Developing Data Products 
subtitle    : Course Assignment - Developing a Shiny App
author      : Xiangting
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Background 

My Shiny Application is based on the mtcars data set:



A data frame with 32 observations on 11 variables. We are interested in the following 5 variables:

1. mpg        Miles/(US) gallon
2. cyl	Number of cylinders
3. hp	Gross horsepower
4. wt	Weight (lb/1000)
5. am	Transmission (0 = automatic, 1 = manual)

--- .class #id 

## Data Structure

Overview of the data structure


```r
head(mtcars)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

--- .class #id 

## App Function

This app uses the mtcars dataset and allows users to predict Miles per gallon (MPG) using 4 variables - Horsepower, number of cylinders, weight and transmission (Automactic or Manual)

This is done through fitting a linear model on these 4 variables.  


```r
lm(mpg ~ hp + cyl + wt +am, data=mtcars)
```

```
## 
## Call:
## lm(formula = mpg ~ hp + cyl + wt + am, data = mtcars)
## 
## Coefficients:
## (Intercept)           hp          cyl           wt           am  
##    36.14654     -0.02495     -0.74516     -2.60648      1.47805
```

--- .class #id 

## App Features

1. The radio buttons choices are use to limit inputs of number of cyliners and transmission to the valid inputs.  

2. Inputs of the users are shown for validation. 

3. The linear model function is used to predict the mpg based on the 4 variables input by the user. 

4. MPG is recalculated and displayed each time user changes a variable.

--- .class #id 

## Interactive Graphs

The app will also produce interactive graphs to show how MPG is related to the 4 variables.

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png) 

