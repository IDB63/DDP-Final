
library(shiny)

shinyUI(fluidPage(

    titlePanel("Old Faithful Geyser Duration by Waiting Time Prediction App"),

    sidebarLayout(
        sidebarPanel(
            sliderInput("obs", 
                "Select the waiting time between eruptions (in mins).",
                min = 43,
                max = 96,
                value = 60),
            h2("How to use this app:"),
            h3("Step 1: Select a waiting time on the slider above"),
            h3("Step 2: Look at the predicted value on the graph (red dot on the red line) to see how the observations (blue dots) compare"),
            h3("Step 3: Look at the Predicted Eruption Duration text below the graph for the prediction based on your selected waiting time")
        ),

        mainPanel(
            plotOutput("distPlot"),
            h3("Predicted Eruption Duration (in mins):"),
            textOutput("pred1")
        )
    )
))
