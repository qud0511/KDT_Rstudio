library(shiny)
# install.packages("plotly")
library(plotly)
library(ggplot2)

df <- data.frame(
  x=c(1,2,3,4),
  y=c(1,2,3,4),
  f=c(1,2,3,4)
)

p <- ggplot(df, mapping = aes(x, y)) + geom_point(aes(frame = f))
p
ggplotly(p)


data(sleep)
sleep %>%
  plot_ly() %>%
  add_trace(x = ~ID,
            y = ~extra,
            type = "bar") %>%
  layout(title = "Bar plot",
         xaxis = list(title = "Species"),
         yaxis = list(title = "Frequency"))

penguins %>%
  plot_ly(x = ~ bill_length_mm,
          y = ~ bill_depth_mm,
          name = ~ species,
          hovertext = ~ island,
          hoverinfo = "x+y+name+text")


library(gapminder)
# x축은 gdpPercap, y축은 LifeExp
# hover는 국가, 인구가 나타나도록
gapminder %>%
  plot_ly(x = ~ gdpPercap,
          y = ~ lifeExp,
          name = ~ country,
          hovertext = ~ pop,
          hoverinfo = "x+y+name+text")

# DASH 패키지















