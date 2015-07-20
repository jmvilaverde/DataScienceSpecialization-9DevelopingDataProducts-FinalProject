getIMC <- function(height, weight) round(weight/(height^2),1)
getIMCFeedback <- function(name, IMC, LL, UL) {
        ifelse (IMC<LL, feedback <- "you are under weight", 
                        ifelse(IMC>UL, feedback<- "you are over weight", 
                               feedback <- "you are in healthy values"))
        paste(name, feedback, sep=", ")
}

shinyServer(
        function(input, output) {
                output$height <- renderPrint({round(input$height,2)})
                output$weight <- renderPrint({round(input$weight,1)})
                IMC <- reactive({getIMC(input$height, input$weight)})
                output$IMC <- renderPrint({getIMC(input$height, input$weight)})
                output$feedback <- renderPrint({getIMCFeedback(input$name, IMC(), input$LowerLimit, input$UpperLimit)})
                midpoint <- reactive({input$LowerLimit+(input$UpperLimit - input$LowerLimit)/2})
                output$midpoint <- renderPrint({midpoint})
                output$plot <- renderPlot({plot(input$height, input$weight, 
                                                xlim=c(1.35, 2.15), ylim=c(45,150), 
                                                xlab="Height", ylab="Weight")
                                           abline(0, 22.5)
                                           })
        })