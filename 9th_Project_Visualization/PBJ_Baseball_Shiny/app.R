# Libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(hrbrthemes)
library(viridis)
library(shiny)
library(shiny)

# library(showtext) # 다운로드 없이 구글 제공 폰트 사용
# font_add_google("Gochi Hand", "gochi")


library(shiny)
df<-read.csv('../kbopitchingdata.csv')

# 결측치가 있어서 필요 없는 컬럼 제거
df <- subset(df, select=-c(games_started,games_finished,intentional_walks,balks,wild_pitches))



# 연도별 바뀐 팀들을 현대의 이름으로 재정렬
for (i in (1:length(df$team))){
  if(df$team[i] == 'MBC Blue Dragons'){
    df$team[i] = 'LG Twins'
  } else if(df$team[i] == 'OB Bears'){
    df$team[i] = 'Doosan Bears'
  } else if(df$team[i] == 'Nexen Heroes' | df$team[i] == 'Woori Heroes'){
    df$team[i] = 'Kiwoom Heroes'
  } else if(df$team[i] == 'SK Wyverns'){
    df$team[i] = 'SSG Landers'
  } else if(df$team[i] == 'Binggre Eagles'){
    df$team[i] = 'Hanwha Eagles'
  } else if(df$team[i] == 'Haitai Tigers'){
    df$team[i] = 'Kia Tigers'
  } else if(df$team[i] == 'Pacific Dolphins' | df$team[i] == 'Chungbo Pintos' | df$team[i] == 'Sammi Superstars'){
    df$team[i] = 'Hyundai Unicorns'
  }
}



ui<-pageWithSidebar(
  headerPanel(h1('SuA')),
  
  sidebarPanel(
    selectInput('years', '우승수?',
                selected=TRUE,
                choices=df$year)
  ),
  
  mainPanel(
    plotOutput('wins')
  )
)


server<-function (input, output) {
  output$wins<-renderPlot({
    df<-subset(df, year==input$years)
    ggplot(df) +
      aes(x = average_age, y = wins, colour = team) +
      geom_point(shape = "circle", size = 1.5)
    
  })
}




shinyApp(ui, server)
