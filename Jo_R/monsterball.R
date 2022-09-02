rm(list=ls())

library(shiny)

ui<-fluidPage(
  tags$h1('안녕, 난 ball이라고 해!!!'),
  tags$img(src='https://th.bing.com/th/id/OIP.tpH3ZVlY6EL9NCJeCJYZ_wHaHr?w=163&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7')
)
server<-function(input,output){
  
}

shinyApp(ui,server)




























