getIMC <- function(height, weight) round(weight/(height^2),1)
getIMCFeedback <- function(name, IMC, LL, UL, OB) {
        ifelse (IMC<LL, feedback <- "you are under weight", 
                        ifelse(IMC<UL, feedback<- "you are in healthy values", 
                               ifelse(IMC<OB, feedback <- "you are over weight",
                                      feedback <- "you have obesity")
                        )
        )
        paste(name, feedback, sep=", ")
}

shinyServer(
        function(input, output) {
                output$height <- renderPrint({round(input$height,2)})
                output$weight <- renderPrint({round(input$weight,1)})
                
                BMI <- reactive({getIMC(input$height, input$weight)})
                output$BMI <- renderPrint({getIMC(input$height, input$weight)})
                output$feedback <- renderPrint({getIMCFeedback(input$name, BMI(), input$LowerLimit, input$UpperLimit, input$ObesityLimit)})
                
                output$plot <- renderPlot({plot(input$height, input$weight, 
                                                xlim=c(1.35, 2.15), ylim=c(45,150), 
                                                xlab="Height", ylab="Weight", pch=10, col="blue")
                                           curve(input$LowerLimit*x^2, add=TRUE, col="Orange")
                                           curve(input$UpperLimit*x^2, add=TRUE, col="tomato3")
                                           curve(input$ObesityLimit*x^2, add=TRUE, col="red")
                                           })
        })