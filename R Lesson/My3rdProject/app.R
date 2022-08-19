library(shiny)

ui <- pageWithSidebar(
  headerPanel(h1("데이터테이블 예제")),
  sidebarPanel(
    checkboxGroupInput("showbars",
                       "컬럼을 선택해보세요:",
                       names(penguins),
                       selected = names(penguins)),
    helpText("오른쪽에서 탭을 선택하면 다른 데이터도 볼 수 있음.")
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("penguins", dataTableOutput("mytable1")),
      tabPanel("state.x77", dataTableOutput("mytable2")),
      tabPanel("airquality", dataTableOutput("mytable3"))
    )
  )
)


server <- function(input, output){
  output$mytable1 <- renderDataTable({
    penguins[, input$showbars, drop = F]
  })
  output$mytable2 <- renderTable({
    state.x77
  }, options = list(bSortClasses = T))
  output$mytable3 <- renderDataTable({
    airquality
  }, options = list(aLengthMenu = c(5, 30, 50),
                    iDisplayLength = 5))
}

shinyApp(ui, server)
