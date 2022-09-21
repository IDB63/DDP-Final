
library(shiny)

shinyServer(function(input, output) {
        model1 <- lm(eruptions~waiting,data=faithful)
        
        model1pred <- reactive({
        waitInput <- input$obs
        predict(model1, newdata=data.frame(waiting=waitInput))
        })
        
        
        
    output$distPlot <- renderPlot({
        waitInput <- input$obs
            
        plot(faithful$waiting,faithful$eruptions, col = 'blue',
             xlab = 'Waiting time to next eruption (in mins)', ylab="Duration of eruption (in mins)",
             main = 'Duration of eruptions by waiting time')
                abline(model1,col="red",lwd=2)
                
        points(waitInput, model1pred(),col="red", pch=16,cex=2)
    })
        output$pred1 <- renderText({
                model1pred()
        })
})
