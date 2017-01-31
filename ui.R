shinyUI(fluidPage(
  titlePanel("Calculate your BMI"),
  
  sidebarLayout(sidebarPanel(

    
    radioButtons(
      inputId  = "units",
      label    = "Units:",
      choices  = c("Metric (kg & m)" = 1, "English (lb & in)" = 2),
      selected = 1
    ),
    
    numericInput(
      inputId = "mass",
      label = "Your weight:",
      value = 65
    ),
    
    numericInput(
      inputId = "height",
      label = strong("Your height:"),
      value = 1.70,
      step  = 0.10
    )
  ),
  
  mainPanel(
    uiOutput("input"),
    uiOutput("result"),
    uiOutput("graph")
  ))
))