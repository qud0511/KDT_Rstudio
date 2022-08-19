library(shiny)

ui <- pageWithSidebar(
  
  headerPanel(
    h1("우리는 왕곰조 입니다(헤더)")
  ),
  
  sidebarPanel(
    sliderInput("count", "니가 원하는게 얼마니?",
                min = 1, max = 10000, value = 5000)
  ),
  
  mainPanel(
    plotOutput("distPlot")
    )
  
)


sever <- function(input, output){
  
  output$distPlot <- renderPlot({
    dist <- rnorm(input$count)
    hist(dist, col = "tomato", breaks = 20)
  })
  
}

shinyApp(ui, server)