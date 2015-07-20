shinyUI(pageWithSidebar(
        headerPanel("Data Science Specialization - Developing Data Products - Final Project"),
        sidebarPanel(
                h1('Input Panel'),
                p('Your name'),
                textInput("name", "Your name", "User"),
                sliderInput("height", "Your Height", 1.75, min=1.35, max=2.15, step=0.01),
                numericInput("weight", "Your weight", 75, min=45, max=150, step=0.1),
                submitButton("Submit")
                ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Results",
                                h4("Your height"),
                                verbatimTextOutput("height"),
                                h4("Your weight"),
                                verbatimTextOutput("weight"),
                                h4("IMC"),
                                verbatimTextOutput("IMC"),
                                h4("Feedback"),
                                verbatimTextOutput("feedback"),
                                plotOutput("plot")
                                ),
                        tabPanel("Config",
                                 numericInput("LowerLimit","Lower limit",20),
                                 numericInput("UpperLimit","Upper limit",25),
                                 h4("Midpoint:"),
                                 verbatimTextOutput("midpoint"),
                                 submitButton("Save")
                                 )
                        )
                )
        )
)