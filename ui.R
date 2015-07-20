shinyUI(pageWithSidebar(
        headerPanel("Developing Data Products - Final Project - Body Mass Index Calculator"),
        sidebarPanel(
                h1('Input Panel'),
                textInput("name", "Your name", "User"),
                sliderInput("height", "Your height", 1.75, min=1.35, max=2.15, step=0.01),
                numericInput("weight", "Your weight", 75, min=45, max=150, step=0.1),
                submitButton("Submit"),
                h2("Instructions:"),
                tabsetPanel(
                        tabPanel("BMI Results",
                                p("1. Input your name into 'Your name' section"),
                                p("2. Input your height into 'Your height' section"),
                                p("3. Input your weight into 'Your weight' section"),
                                p("4. Click submit to obtain the result into 'BMI Results' tab.")
                        ),
                        tabPanel("Config limits",
                                p("1. Go to 'Config limits' tab."),
                                p("2. Set Lower, Upper and Obesity limits."),
                                p("3. Click Save.")
                        )
                )
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel("BMI Results",
                                h4("Your height"),
                                verbatimTextOutput("height"),
                                h4("Your weight"),
                                verbatimTextOutput("weight"),
                                h4("Your BMI"),
                                verbatimTextOutput("BMI"),
                                h4("Feedback"),
                                verbatimTextOutput("feedback"),
                                plotOutput("plot")
                                ),
                        tabPanel("Config limits",
                                 numericInput("LowerLimit","Lower limit",18.5, step=0.5),
                                 numericInput("UpperLimit","Upper limit",25, step=0.5),
                                 numericInput("ObesityLimit","Obesity limit",30, step=0.5),
                                 submitButton("Save")
                                 )
                        )
                )
        )
)