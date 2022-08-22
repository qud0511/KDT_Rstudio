# state.x77 : 행렬 형태로 제공되는 R의 내장 데이터셋

str(state.x77)
# 클래스 확인 : matrix array
class(state.x77)

is.matrix(state.x77)

# 데이터 구조의 자료형 확인
is.data.frame(state.x77)

# 자료형 변환
df.x77 <- as.data.frame(state.x77)
View(df.x77)
# 행렬은 데이터 프레임으로 자료형 변환 가능함.

str(df.x77)
dim(df.x77) # 행렬 갯수 확인

# 인구수 1위
# 면적 1위
# 결빙 구간 1위
# 고등학교 졸업 1위
# 문맹률 1위
# 고등학교 졸업 and 문맹률 상관
max(df.x77$Population)
df.x77[df.x77$Population==max(df.x77$Population),]

# 인구가 가장 많은 주의 이름은??
rownames(st_df[st_df$Population==max(st_df$Population),])

# 면적이 가장 큰 주의 이름은
rownames(st_df[st_df$Area==max(st_df$Area),])


# csv 파일 생성하고 읽기
irisDF <- iris
irisDF$Sepal.Sum <- irisDF$Sepal.Length + irisDF$Sepal.Width
write.csv(irisDF, 'iris_Sepal_Sum.csv', row.names = F)
getwd()
sumDF <- read.csv('iris_Sepal_Sum.csv', header = T)
str(sumDF)

# install.packages('readxl')
library(readxl)
df <- read_excel('성적.xlsx', sheet=1)
df
str(df)
class(df)

df <- data.frame(df)
df
# A tibble: 5 × 5... 없애고 싶으면

# df$평균 칼럼 만들기
# mean(df$R + df$파이썬 + df$머신러닝)은 안됨. 학생별 평균 점수가 아님.

# avg(df$R + df$파이썬 + df$머신러닝) / 3
df$평균 <- round(apply(df[, 3:5], MARGIN = 1, mean),2)
# MARGIN : axis와 비슷
head(df)
write.csv(df, 'score.csv', row.names = F)




# 결측치
x <- c(45, NA, 87, 63, 55, NA, 72, 61, 59, 68)
mean(x)
mean(x, na.rm=T)

var(x, na.rm=T)
sd(x, na.rm=T)

?airquality
str(airquality)
head(airquality)

aqDF <- airquality
complete.cases(aqDF)
aqDF[complete.cases(aqDF), ]

mean(aqDF$Ozone)
mean(aqDF$Ozone, na.rm = T)

is.na(aqDF$Ozone)
aqDF$Ozone[is.na(aqDF$Ozone)]
sum(is.na(aqDF$Ozone))

ozone <- aqDF$Ozone
ozone[is.na(ozone)] <- 0
ozone # 0을 넣으면 평균값이 낮아짐

ozone[is.na(ozone)] <- mean(ozone, ra.rm=T)
ozone # 평균을 넣으면 표준편차 값이 낮아짐.

mean(aqDF$Ozone, na.rm = T)
mean(ozone)
sd(ozone)
sd(aqDF$Ozone, na.rm = T)




ozone02 <- aqDF$Ozone
ozone02[is.na(ozone02)] <- sample(na.omit(aqDF$Ozone), 37)
ozone02 # sample: 37개를 랜덤으로 뽑아옴?

complete.cases(aqDF)
aqDF[complete.cases(aqDF), ]
aqDF
aqDF[!complete.cases(aqDF), ]
aqDF


# install.packages('VIM')
library(VIM)
?aggr
aggr(airquality, prop=F, numbers=T, sortVar=T)


# na.omit() 함수 : 데이터 프레임에서 결측치를 제거
# mice 패키지의 mice() 함수: 결측치를 여러 가지 통계적 방법으로 대체


# 이상치 : outliers or anomalies
# boxplot() : 데이터셋에 이상치가 존재하는 지를 시각화

st <- data.frame(state.x77)
boxplot(st$Income, pch=19, col='tomato', border = 'red')

boxplot.stats(st$Income)
class(boxplot.stats(st$Income))

boxplot.stats(st$Income)$out
# 함수의 리턴값에 $ 붙일 수 있음

st[st$Income == boxplot.stats(st$Income)$out, ]
# 소득이 가장 높은 주 : 알래스카

# 이상치가 통계량을 왜곡할 때는 결측치로 변환하여
# 통계분석 대상에서 제외



# 독립변수 종속변수?
irisDF <- iris
boxplot(irisDF$Petal.Length, col = 'skyblue')

# 범주로 구분할 수 있는 데이터는 범주별로 이상치를 확인할 수 있음
boxplot(Petal.Width ~ Species, data=iris)
#       종속변수 ~ 독립변수1 + 독립변수2
#           y    ~     x
# ~는 포뮬러 연산자


# 이상치가 여러 개인 경우에는 %in% 연산자를 활용하여 결측치를 제거

df <- with(iris, iris[Species == "setosa", ])
boxplot.stats(df$Petal.Width)

iris[iris$Petal.Length %in% outlier, ]

outlier <- boxplot.stats(df$Petal.Width)$out
df[df$Petal.Width %in% outlier, ] <- NA
df.no.outlier <- na.omit(df)
nrow(df.no.outlier)


# • 데이터의 형태를 통계분석에 적합한 형태로 변환하기 위한 R 함수들:
# - 선택: subset()
# - 집계: aggregate()
# - 분리: split()
# - 결합: rbind(), cbind(), merge()
# - 정렬: sort(), order()

# subset() 함수: 인덱싱이나 필터링보다 간편하게 필요한 데이터를 추출
subset(iris, subset = Species == "setosa")
#            행렬조건

st <- data.frame(state.x77)
st[st$Population == max(st$Population), c(3,6)]

subset(st,
       subset = st$Population == max(st$Population),
       select = c(3,6)

iris[, -5]
subset(iris, select =  1:4)

set <- iris[iris$Species == 'setosa', ]
ver <- iris[iris$Species == 'versicolor', ]
vir <- iris[iris$Species == 'virginica', ]

sp <- split(iris, f=iris$Species)
length(sp)
names(sp)
class(np)

  
  
library(readxl)
df.1 <- read_excel("성적.xlsx", sheet=1)
df.2 <- read_excel("성적.xlsx", sheet=2)
df.1
df.2

cbind(df.1, df.2)
merge(df.1,df.2)  
  
merge(df.1,df.2, 
      all=T, 
      by.x=c('번호', '이름'), 
      by.y=c('No', 'Name'))   


  
  
# aggregate() 함수: 범주별로 통계량을 확인하고 싶을 때 주로 활용  
# df <- subset(iris, select = c(1,2))
df <- iris
aggregate(df[, -5], by=list(품종=iris$Species), FUN=mean)  


library(MASS)
data("survey")
df <- survey
head(df)
str(df)

df <- na.omit(df)
df
df <- df[complete.cases(df), ]
df

dim(df)
hist(df$Height, breaks = 20)

# 남자만
hist(df[df$Sex == 'Male', ]$Height, breaks = 20)

# 여자만
hist(df[df$Sex == 'Female', ]$Height, breaks = 20)

mean(df[df$Sex == 'Male', ]$Height)
mean(df[df$Sex == 'Female', ]$Height)

aggregate(df[, c(10,12)],
          by = list(Gender = df$Sex),
          FUN = mean)

table(df$Sex)
t.test(Height ~ Sex, data=df)

boxplot(Height ~ Sex, data = df)


v <- c(30,40,20,40,10)
v
sort(v)
sort(v, decreasing = T) # 내림차순

df <- data.frame(state.x77)
str(df)

sort(df$Illiteracy, decreasing = T)

ord <- order(df$Illiteracy, decreasing = T)

df[ord[1:10], c(3,2)]


sample(1:10, size = 5)

s <- 0
for (i in 1:100000) {
  x <- sample(1:10, size=5)
  s <- s + sum(x == 7)
}
s

set.seed(2022)
sample(1:10, size=5, replace=T)

idx <- sample(1:nrow(iris), size=5)
iris[idx, ]

# install.packages('palmerpenguins')
library(palmerpenguins)
data(package = 'palmerpenguins')
data('penguins')

pg <- data.frame(penguins)
str(pg)

library(VIM)
aggr(pg, numbers=T, prop=F)
pg <- na.omit(pg)
dim(pg)

str(pg)
table(pg$species)
barplot(table(pg$species))

table(pg$island)
barplot(table(pg$island))

table(pg$sex)
barplot(table(pg$sex))

str(pg[, 3:6])
summary(pg[, 3:6])

par(mfrow = c(2,2))
hist(pg$bill_length_mm, col=2:5)
hist(pg$bill_depth_mm, col=c('orange','blue'))
hist(pg$flipper_length_mm)
hist(pg$body_mass_g)
par(mfrow = c(1,1))

my.color <- ifelse(pg$species == 'Gentoo', 'tomata',
                   ifelse(pg$species == 'Adelie', 'stellblue'))
plot(pg$bill_length_mm, pg$bill_depth_mm,
     pch=19, col='tomato')


-
