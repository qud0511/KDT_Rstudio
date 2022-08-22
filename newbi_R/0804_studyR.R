getwd()

data()

View(iris)
?iris

hist(iris$Petal.Length, col='orange',
     main='꽃잎의 길이에 대한 히스토그램',
     xlab='꽃잎의 길이',
     ylab='빈도수')

# 2장 연습문제 2.2
# 꽃잎의 너비(Petal.Width)

# 평균
mean(iris$Petal.Width)

# 분산
var(iris$Petal.Width)

# 표준편차
sd(iris$Petal.Width)
# --------

# 2장 연습문제 2.3
hist(mtcars$hp)

# 산점도
plot(mtcars$hp, mtcars$mpg, col='red', pch=88)

# pch => 모양
mtcars$hp
mtcars$mpg

summary(cars$speed) # 사분위

str(cars$speed) # pandas의 describe와 비슷함 

# 한 변의 길이가 x인 정사각형의 넓이 area를 구하는 수식
squre_func <- function(x){
  area <- x^2
  print(area)
}
squre_func(5)

# 반지름의 길이가 r인 둘레 round이 넓이 area를 구하는 수식
round_func <- function(r){
  area = 3.14*(r^2)
  print(area)
}
round_func(5)

# 피자나라 치킨공주
order_func <- function(n){
  order <- 'diet'
  if (n%%3==0 & n%%5==0){
    order <- '피자나라 치킨공주'
  }
  else if (n%%3==0){
    order <- '피자'
    }
  else if (n%%5==0){
    order <- '치킨'
    }
  print(order)
}
order_func(5)
  






