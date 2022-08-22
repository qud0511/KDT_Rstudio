
df <- read.csv("kbopitchingdata.csv")
# View(df)
str()


# 결측치가 있어서 필요 없는 컬럼 제거
df_01 <- subset(df, select=-c(games_started,games_finished,intentional_walks, balks, wild_pitches))

# 연도별 바뀐 팀들을 현대의 이름으로 재정렬
for (i in (1:length(df_01$team))){
  if(df_01$team[i] == 'MBC Blue Dragons'){
    df_01$team[i] = 'LG Twins'
  } else if(df_01$team[i] == 'OB Bears'){
    df_01$team[i] = 'Doosan Bears'
  } else if(df_01$team[i] == 'Nexen Heroes' | df_01$team[i] == 'Woori Heroes'){
    df_01$team[i] = 'Kiwoom Heroes'
  } else if(df_01$team[i] == 'SK Wyverns'){
    df_01$team[i] = 'SSG Landers'
  } else if(df_01$team[i] == 'Binggre Eagles'){
    df_01$team[i] = 'Hanwha Eagles'
  } else if(df_01$team[i] == 'Haitai Tigers'){
    df_01$team[i] = 'Kia Tigers'
  } else if(df_01$team[i] == 'Pacific Dolphins' | df_01$team[i] == 'Chungbo Pintos' | df_01$team[i] == 'Sammi Superstars'){
    df_01$team[i] = 'Hyundai Unicorns'
  }
}

# K-리그 선수들의 나이
# https://r-graph-gallery.com/violin_horizontal_ggplot2.html

# Libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(forcats)
library(hrbrthemes)
library(viridis)

# Plot
p <- df_01 %>%
  ggplot( aes(x=team, y=average_age, fill=team, color=team)) +
  geom_violin(width=1.6, size=0.5) +
  scale_fill_viridis(discrete=TRUE) +
  scale_color_viridis(discrete=TRUE) +
  theme_ipsum() +
  theme(
    legend.position="none"
  ) +
  coord_flip() + # This switch X and Y axis and allows to get the horizontal version
  xlab("") +
  ylab("age")
p
