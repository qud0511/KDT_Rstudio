library(palmerpenguins)

data(package='palmerpenguins')
commen('palmerpenguins패키지 안의 데이터셋의 설명을 보여줌')

data('penguins')
comment('데이터셋 쓸수 있음')

pg <- data.frame(penguins)


# 집단별로 비율 확인
df <- na.omit(penguins)
table(df$species)
prop.table(table(df$species)) # prop.table() => 비율

tapply(df$species, INDEX = list(df$species),
       FUN = length)

table(df$island)
prop.table(table(df$island))

library(gmodels)
CrossTable(df$island, df$species,
           prop.t = F)

?CrossTable


library(psych)
describe(df)[,c(1:3, 8:9)]

library(ggplot2)


# • aggregate() 함수를 이용하여 범주별 기술통계량을 산출할 수 있다. 
# • 펭귄의 종별로 부리의 길이와 깊이, 날개의 길이, 체질량의 평균을 확인해보자
aggregate(df[, 3:6],
          by=list(species=df$species),
          FUN=mean)

tapply(df$bill_length_mm,
       INDEX=list(species=df$species),
       FUN=mean)

tapply(df$bill_depth_mm,
       INDEX=list(species=df$species),
       FUN=mean)


# • 펭귄의 종별로 박스플롯을 그려보자.
boxplot(flipper_length_mm ~ species,
        data = df, col = 2:4)

# outlier <- boxplot.stats(df$flipper_length_mm[df$species == 'Adelie'])$out

df <- data.frame(df)
# Adelie에서만 outlier가 나옴
adelie <- split(df, df$species)$Adelie
adelie
outlier <- boxplot.stats(adelie$flipper_length_mm)$out
outlier
df[df$flipper_length_mm %in% outlier, ]
dim(df[df$flipper_length_mm %in% outlier, ])
View(df)

# • penguins 데이터셋을 날개의 길이를 기준으로 오름차순으로 정렬하되, 
# • 날개의 길이가 같으면 체질량을 기준으로 내림차순으로 정렬해보자.
library(palmerpenguins)
df <- na.omit(penguins)
df <- data.frame(df)

# 날개 길이 오름차순, 체질량 내림차순으로 정렬
ord <- order(df$flipper_length_mm, -df$body_mass_g)
ord <- order(df$flipper_length_mm, df$body_mass_g, decreasing = FALSE) # decreasing = FALSE 주면 둘다 내림차순함.
ord
df[ord, ]
head(df[ord, 5:6], n=10) # 10개만 보여줘줘
















