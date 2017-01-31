#input parameters
metric   = 1;
imperial = 2;

#function to calculate bmi
  bmi <- function(mass, height, units) {
            bmi = mass / height^2
            
              if (units == imperial) {
                        bmi = bmi * 703
                }
            
              return (bmi)
    }


library(shiny)
  
shinyServer(function(input, output) {
  output$input <- renderText({
    if (input$units == metric) {
      unit.weight = "kg"
      unit.height = "m"
    } else {
      unit.weight = "lb"
      unit.height = "in"
    }
    
    paste0("You are ", input$mass, " ", unit.weight, " and ", input$height, " ", unit.height, " long")
  })
  
  output$result <- renderText({
    bmi = bmi(mass = input$mass, height = input$height, units = input$units)
    
    if      (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (bmi <= 25.0) info = "<span style='color: green'>Healthy weight</span>"
    else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else                  info = "<span style='color: red'>Obese</span>"
    
    paste0("Your BMI is ", round(bmi, 1), ", which is: ", info)
  })
  
  output$graph <- renderText({
    "<img style='width: 30em; margin-top: 1em' src='http://www.fatweightlossguide.com/wp-content/uploads/2012/07/bmi-formula.png'  />"
  })
  

  
})