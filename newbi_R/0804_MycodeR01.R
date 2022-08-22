3+4
print('Hellom R!')

x=3

x <- 3
3 -> y


x <- 3
y<-5
z<-x+y
print(z)
z

getwd()

plot(iris)
?iris
View(iris)
data()

install.packages('cowsay')
library('cowsay')
library('ggplot2')

say('안녕, 난 발뼝준준이야!')
say('안녕!', by = 'rabbit')
say('안녕~', by = 'chicken')
say('안녕~', by = 'owl')
say('안녕~', by = 'trilobit')

str(iris)

class(iris$Species)
levels(iris$Species)
table(iris$Species)
barplot(table(iris$Species))

class(iris$Petal.Length)
mean(iris$Petal.Length)
hist(iris$Petal.Length, col='pink')

plot(mtcars$mpg, mtcars$wt)

str(cars)
?cars

plot(cars$speed)
plot(cars$dist)
plot(cars$speed, cars$dist,
     col = 'tomato',
     pch = 19)

str(iris)
mean(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
hist(iris$Petal.Length, 
     col = 'tomato',
     breaks=5)

n<-5
if (n%%3 == 0 & n%%5 == 0){
  order <- 'Pizza'
} else if (n%%3 == 0){
  order <- 'Pizza'
} else if (n%%5 == 0){
  order <- 'Chicken'
} else {
  order <-'diet'
} 
order


v1 <- vector(length = 2)
v1

v2 <- 1:10
v2

v1 <- c(T, T, F, F, T)
v1

v2 <- c(T, F, 3, 3.14) 
v2

v3 <- c(3, 3.14, "PI=3.14")
v3

v4 <- c(T, F, 3, "3.14")
v4

v <- c(10, 20, 30, 40, 50, 60, 70)
v

v[1]
v[8] # NA 반환
v[6:8] # 60 70 NA 반환
v[7]

v[1:3]
v[3:6]

v[c(T, T, F, F, F, T, T)]

v[c(1,3,4,7)]

v[-10]
v[-9]
v[-8] # 8번째 원소빼고, 근데 8번째 원소 없으니까 다 줘
v[-7] # 7번째 원소 즉, 70빼고 다 줘 
v[-6]
v[-1] # 첫 번째 원소를 제외한 나머지들.. 파이썬이랑 다름
v[-1:3] # 오류
v[-1:-3] # 1 ~ 3번째 원소 빼고
v[-(1:3)] # 위와 동일
v[-7:-3] # 7 ~ 3번째 요소들 빼고 줘

v[7] <- 700 # 7번 요소 700으로 고치기
v

v[1:3] <- c(100, 200, 300)
v

v[c(T,T,F,F,F,T,F)]

v > 30
v[v>30]

!v > 30
v[!v>30]

v+1

c(10,20,30) + c(30,40,50)

c(10,20,30) + 30

1:9 + 1:2

rep(1:3, times =3)

v
v[c(T,F)]

# 1에서 100까지의 수 중에서 7의 배수의 합은?
seq(7,100,7)
sum(seq(7,100,7))

v <- 1:100
sum(v[v%%7==0])

v <- c()
v
v <- c(v,1)
v

for (i in 1:10) {
  v <- c(v,i)
}
v

for (i in 1:10) {
  v[i] <- i
}
v

v <- c(10,20,30)
v[7] <- 70
v

iris$Sepal.Length





f <- factor(c('Male', 'Female', 'Male', 'Female'))
f
levels(f)

f[f=='Female']

f[6]

v.1 <- c(1,2,3)
v.2 <- c('F','T','M')
c(v.1,v.2)

lst <- list(id=v.1, gender=factor(v.2))
lst

lst[1]
lst[1:2] # 이렇게 하면 안됨. 벡터의 벡터니까
lst[[1:2]] # $주거나 두 개의 대괄호
lst$id
lst$gender


v <- 1:10
which(v%%3==0)
which(v>5)
v[which(v>5)]


n <- 32
# n의 약수를 모두 출력하시오
# 반복문은 사용하지 마시오
d <- seq(1,32)
d
d[n%%d==0]

1:n[n%% 1:n==0]

v <- 1:n
v[n%%v==0]

# 약수의 갯수
n=32
v <- 1:n
length(v[n%%v==0])

iris
str(iris)
View(iris)

iris[ 1, ] # [행,렬]에대한 정보
iris[ 1:5 , ]
iris[ 1:5 , 1 ]
iris[ 1:5 , 1:2 ]
iris[ 1:5 , 1:4]
iris[ 1:5 , -5]

iris[, 1]
iris$Sepal.Length # iris[, 1]와 같음

iris[ iris$Sepal.Length <5, -5 ]

length(iris[ iris$Sepal.Length <5, -5 ])
nrow(iris[ iris$Sepal.Length <5, -5 ])


# Petal.Length가 평균보다 큰 데이터의
# Petal.Width 평균값은 얼마?

iris[mean(iris$Petal.Length) < mean(iris$Petal.Width)]

a = iris$Petal.Length

mean(iris$Petal.Width[a > mean(a)])

# 교수님
mean(iris[iris$Petal.Length > mean(iris$Petal.Length), 'Petal.Width'])

fun <- function(x){
  return (x+y+5)
}
y <- 3
fun(5)

my.fun <- function(x,y,z) {
  cat(x,y,z, '\n')
  return (x+y*2 +z*3)
}
my.fun
my.fun(1,2,3)

my.fun(1,2,x=3)

seq(from = 2, to = 100, by = 20)
seq(2,100,20)


divisor <- function(n){
  # to do
  x <-  1:n
  length(1:n[n%%(1:n)==0])
}
divisor(n=32)


div.cnt <- function(n) length((1:n)[n%%(1:n)]==0)
div.cnt(n=32)

for (i in 15){
  cat(i, div.cnt(i), '\n')
}

f1 <- function(n) n^2
f1(n=5)

sapply(1:9, FUN=f1)


(1:100)[sapply(1:100, FUN=div.cnt)==2]

length((1:100)[sapply(1:100, FUN=div.cnt)==2])

























































































































































