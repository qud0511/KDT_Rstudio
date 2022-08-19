library(shiny)

server <- function(input, output){
  output$mytable1 <- renderDataTable({
    diamonds[, input$showvars, drop = F]
  })
  output$mytable2 <- renderTable({
    iris
  })
  output$mytable3 <- renderDataTable({
    mtcars
  })
}

shinyApp(ui, server)