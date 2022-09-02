rm(list=ls())

library(shiny)

# 예제1
ui<-fluidPage(
  tags$h1('너의 선택을 보여줘!!!'),
  selectInput('dataset',label='Dataset',choices=c('iris','mtcars','state.x77')),
  verbatimTextOutput('summary'),
  tableOutput('table')
)
comment('label=옵션은 출력되는 이름을 원하는 대로 출력 가능')

server<-function(input,output){
  output$summary<-renderPrint({
    dataset<-get(input$dataset,'package:datasets')
    summary(dataset)
  })
  
  output$table<-renderTable({
    dataset<-get(input$dataset,'package:datasets')
    dataset
  })
}

shinyApp(ui,server)

# 예제2
ui_s2<-fluidPage(
  tags$h1('예제2'),
  selectInput('dataset',label='Dataset',choices=c('iris','mtcars')),
  tableOutput('table'),
  verbatimTextOutput('summary')
)

server_s2<-function(input,output){
  dataset<-reactive({
    get(input$dataset,'package:datasets')
  })
  
  output$summary<-renderPrint({
    summary(dataset())
  })
  
  output$table<-renderTable({
    dataset()
  })
}

shinyApp(ui_s2,server_s2)

# 연습1
ui1<-fluidPage(
  tags$h1('너의 선택을 보여줘!!!'),
  selectInput('dataset',label='Dataset',choices=c('iris','mtcars','state.x77')),
  tableOutput('table'),
  verbatimTextOutput('summary')
)
comment('요약통계량이 나중에 나옴')

server1<-function(input,output){
  output$str<-renderPrint({
    dataset<-get(input$dataset,'package:datasets')
    str(dataset)
  })
  
  output$table<-renderTable({
    dataset<-get(input$dataset,'package:datasets')
    dataset
  })
}

shinyApp(ui,server)

# 연습2
ui2<-fluidPage(
  tags$h1('연습2'),
  selectInput('dataset',label='Dataset',choices=c('iris','mtcars')),
  tableOutput('table'),
  verbatimTextOutput('summary')
)

server2<-function(input,output){
  output$summary<-renderPrint({
    dataset<-get(input$dataset,'package:datasets')
    summary(dataset)
    #cat(colnames(input$dataset))
  })
  
  output$table<-renderTable({
    dataset<-get(input$dataset,'package:datasets')
    head(dataset)
  })
}

shinyApp(ui2,server2)





























