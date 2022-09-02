rm(list=ls())
colors()

# 시각화를 위한 패키지 설치
library(tidyverse)

# anscombe셋
## 데이터 확인
anscombe
str(anscombe)
class(anscombe)

## x평균
mean(anscombe$x1)
mean(anscombe$x2)
mean(anscombe$x3)
mean(anscombe$x4)

## y평균
mean(anscombe$y1)
mean(anscombe$y2)
mean(anscombe$y3)
mean(anscombe$y4)

## 상관계수
cor(anscombe$x1,anscombe$y1)
cor(anscombe$x2,anscombe$y2)
cor(anscombe$x3,anscombe$y3)
cor(anscombe$x4,anscombe$y4)

## 선형회귀
lm(y1~x1,data=anscombe)
lm(y2~x2,data=anscombe)
lm(y3~x3,data=anscombe)
lm(y4~x4,data=anscombe)

## 선형그래프
par(mfrow=c(2,2))
plot(anscombe$x1,anscombe$y1,col='orange',pch=19)
abline(lm(y1~x1,data=anscombe),col='tomato')
plot(anscombe$x2,anscombe$y2,col='orange',pch=19)
abline(lm(y2~x2,data=anscombe),col='tomato')
plot(anscombe$x3,anscombe$y3,col='orange',pch=19)
abline(lm(y3~x3,data=anscombe),col='tomato')
plot(anscombe$x4,anscombe$y4,col='orange',pch=19)
abline(lm(y4~x4,data=anscombe),col='tomato')
par(mfrow=c(1,1))

# mpg셋
## 데이터 확인
str(mpg) # 구조
class(mpg) # 타입
summary(mpg) # 요약 통계략
colSums(is.na(mpg)) # NA값 수
head(mpg)

## ggplot()
### 방법1
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point()
comment('aes로 축을 설정 가능')

### 방법2
comment('이렇게 ggplot을 변수에 저장시키는것도 가능')
p<-ggplot(data=mpg,mapping=aes(x=displ,y=hwy))
p+geom_point()

### 방법3
p<-ggplot(data=mpg,mapping=aes(x=displ,y=hwy))
gp<-geom_point(col='red',lwd=3)
p+gp

### 방법4
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point(aes(color=class,size=class,shape=class,alpha=0.3))
comment('class별로 색도 크기도 모양도 다르게 해줌
        alpha=옵션으로 투명도를 나타냄')

### 방법5
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point(aes(color=class,shape=class,alpha=0.3))

## facet_wrap()
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point(col='orange') + 
  facet_wrap(~class,nrow=2)

## facet_grid()
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point(col='orange') + 
  facet_grid(drv~cyl)

## 다양한 geom_----()
### geom_smooth()
ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point(col='blue')+
  geom_smooth(col='cyan')
comment('점 자체에 색이 blue임')

ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point(aes(col=class))+
  geom_smooth(col='cyan')
comment('class별 점 색이 달라짐')

## coord_flip()
comment('x축 y축 뒤집기')

p_bar_mpg<-ggplot(data=mpg,aes(x=class,y=hwy))
p_bar_mpg+geom_boxplot(fill='brown')+coord_flip()

## geom_bar()


# diamonds셋
## cut별 빈도 막대 그래프
table(diamonds$cut)
barplot(table(diamonds$cut))
comment('이 모양의 그래프를 ggplot를 이용하여 그리고 싶음')

## geom_bar()
ggplot(data=diamonds,aes(x=cut))+
  geom_bar(col='peru',fill='skyblue')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut),col='black',fill='pink')
comment('mapping=aes()옵션은 ggplot에서도 geom_bar()에서도 사용 가능함
        fill=clarity는 clarity별로 나누지 않음')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),col='black')
comment('aes안에 fill옵션이 있으면 범례가 생기고 aes밖에 있으면 범례가 사라짐')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),col='skyblue',position='fill')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),col='skyblue',position='dodge')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=clarity),col='skyblue',position='jitter')

ggplot(data=diamonds)+
  geom_bar(aes(x=cut,fill=cut),show.legend=F,width=1)
comment('width는 작을 수록 막대의 너비가 작아짐')

ggplot(data=diamonds,aes(x=cut,fill=cut))+
  geom_bar(show.legend=F,width=0.5)+
  labs(x=NULL,y=NULL)+
  theme(aspect.ratio=1)+
  coord_polar()

ggplot(data=diamonds,aes(x=cut,fill=cut))+
  geom_bar(show.legend=F,width=1)+
  labs(x=NULL,y=NULL)+
  theme(aspect.ratio=1)+
  coord_polar()

# 지도 시각화
world<-map_data('world')
ggplot(world,aes(long,lat,group=group))+geom_polygon(fill='lightyellow',color='blue')

# %>%연산자(파이프라인 연산자)
## 평균보다 큰 hwy파일에서 필요한 4열만 가지고와 표준편차를 구하기
### 기존 방식
sd(mpg[mpg$hwy>mean(mpg$hwy),c(1,2,9,11)]$hwy)

### 연산자 사용
mpg%>%
  select(c(1,2,9,11))%>%
  filter(hwy>mean(hwy))%>%
  summarize(sd_mpg_hwy=sd(hwy))

## 
best.in.class<-mpg%>%
  group_by(class)%>%
  filter(row_number(desc(hwy))==1)

p<-ggplot(data=mpg,mapping=aes(x=displ,y=hwy))

p+geom_point(aes(color=class))+
  geom_text(aes(label=model),data=best.in.class)

p+geom_point(aes(color=class))+geom_label(aes(label=model), data=best.in.class,nudge_y=2,alpha=0.5)+theme(legend.position='top')
comment('범례 위치 변경
        top,bottom 등 다양함')

# 그래프 png나 pdf로 변환하기
comment('마지막으로 그린 그림이 저장이 됨')
getwd()
ggsave('./figures/myplot.png')
ggsave('./figures/myplot.pdf',width=1920,height=1080,units='px')

# 출처: https://r-graph-gallery.com/histogram_several_group.html
library(ggplot2)
library(dplyr)
library(hrbrthemes)

data <- data.frame(
  type = c( rep("variable 1", 1000), rep("variable 2", 1000) ),
  value = c( rnorm(1000), rnorm(1000, mean=4) )
)

p<-data%>%ggplot(aes(x=value, fill=type))+geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +scale_fill_manual(values=c("#69b3a2", "#404080")) + theme_ipsum() + labs(fill="")

p

# 펭귄데이터셋
## 성별에 따른 히스토그램을 겹쳐서 그리기
library(palmerpenguins)
pg<-penguins
pg<-pg[complete.cases(pg),]
str(pg)
table(pg$sex)
pg%>%ggplot(aes(bill_length_mm,fill=sex))+geom_histogram(alpha=0.3,position='identity',bins=50)+scale_fill_manual(values=c('red','blue'))+theme_ipsum()+labs(fill='')
?geom_histogram

colSums(is.na(pg))

# esquisse한 코드 만들기
## 코드 1
library(esquisse)
comment('Tools->Addins->Browse Addins')

library(dplyr)
library(ggplot2)

gapminder::gapminder %>%
 filter(year >= 2007L & year <= 2007L) %>%
 ggplot() +
 aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop, group = gdpPercap) +
 geom_point(shape = "square open") +
 scale_color_hue(direction = 1) +
 labs(x = "소득", y = "기대수명", 
 title = "Esquisse plot", subtitle = "good", caption = "gyc") +
 theme_dark() +
 facet_wrap(vars(year))

## 코드2
library(dplyr)
library(ggplot2)

gapminder::gapminder %>%
 filter(year >= 1997L & year <= 2007L) %>%
 ggplot() +
 aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop, group = gdpPercap) +
 geom_point(shape = "bullet") +
 scale_color_hue(direction = 1) +
 labs(x = "소득", y = "기대수명", 
 title = "1997~2007", subtitle = "plot", caption = "cgy") +
 theme_classic() +
 facet_wrap(vars(year))

library(shiny)
ui <- fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)









































































