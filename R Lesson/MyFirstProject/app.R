library(shiny)
library(ggplot2)
library(gapminder)

ui <- pageWithSidebar(
  
  headerPanel(
    h1("우리는 왕곰조 입니다(헤더)")
  ),
  
  sidebarPanel(
    sliderInput("count", "니가 원하는게 얼마니?",
                min = 1, max = 10000, value = 5000)
  ),
  
  mainPanel(
    h3("니가 원하는 그림이 이거지?"),
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










ui <- pageWithSidebar(
  
  headerPanel(
    h1("우리는 왕곰조 입니다(헤더)")
  ),
  
  sidebarPanel(
    
    selectInput("year",
                "몇 년도를 보여드릴깝쇼?",
                seq(1952, 2007, 5))
  ),
  
  mainPanel(
    h3("해당 연도의 GDP 대비 기대수명 그래프입니다."),
    plotOutput("distPlot")
  )
  
)


server <- function(input, output){
  output$distPlot <- renderPlot({
    ggplot(subset(gapminder, year == input$year), aes(x = gdpPercap, y = lifeExp)) + 
      geom_point(aes(color = continent)) +
      scale_x_log10() + 
      geom_smooth()
  })
}

shinyApp(ui, server)














