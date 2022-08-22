# matrix는 데이터 유형이 같아야 함.
#                          행,렬
m <- matrix(c(1,2,3,4,5,6), 3,2)
m
t(m) # 행렬 바꾸기

paste('A', 'B', 'C')
# 텍스트 결합

myclass <- readline('What is your favorite class?')
myclass
# 콘솔에서 사용자로부터 입력 => 입력 값 myclass에 저장

paste('My favorite class is', myclass)

data()

x <- 3
(x>3) || (x<4)


score <- readline('점수를 입력하시오')
if (score>90){
  grade <- 'A'
} else if (score>=80){
  grade <- 'B'
} else{
  grade <- 'C'
}
score
grade

# while문 1~10 더하기
s <- 0
i <- 1
while (i<=10) {
  s <- s+i
  i <- i+1
}
s
i

# for문 1~10 더하기
s <- 0
for (i in 1:10){
  s <- s+i
}
s

# 약수 구하기
n <- 32
count <- 0
for (i in 1:n){
  if (n%%i==0){
    cat(i, ' ')
    count <- count+1
  }
}
count

# 소수 구하기
n <- 17
is.prime = TRUE
for (i in 2:(n-1)) {
  if (n %% i == 0) {
    is.prime <- FALSE
    break # 소수는 1과 자기자신이 아닌 수가 하나라도 나오면 안되므로, 공정 간소화
  }
}
is.prime

# 이중for문
for (i in 1:3){
  cat(i, ': ')
  for (j in 1:5){
    cat(j, ' ')
  }
  cat('\n')
}

# 한 변의 길이가 x인 정사각형 넓이
x <- 5
area <- x^2
area

squre_func <- function(x){
  area <- x^2
  cat(area)
}
squre_func(10)

# 반지름 길이가 r인 원의 둘레, 넓이
circle_func <- function(r){
  pi <- 3.141592
  round <- 2*r*pi
  area <- r*r*pi
  cat('원의 둘레 : ',round, '원의 넓이 : ', area)
}
circle_func(5)

# 연습문제 3.5
# 임의의 홀수 𝑛에 대하여
# - 이중 for-loop를 이용하여 아래와 같이 별(*) 모양을 찍어보시오.

aster_func <- function(n){
  for (i in 1:n){
    cat('\n')
  for (j in 1:n){
    if (i >= j){
      cat('*' )  
    }
  }
}}
aster_func(5)

for (i in 1:5){
  
}



for (i in 1:5){
  cat('\n')
  for (j in 1:5){
    if (i>=j){
      cat('*')
    }
  }
}


# ---------------------
n <- 5
for (i in 1:n) {
  for (j in 1:n) {
    cat('*')
  }
  cat('\n')
}

n <- 5
for (i in 1:n) {
  for (j in 1:i) {
    cat('*')
  }
  cat('\n')
}

n <- 5
for (i in 1:n) {
  if (i %% 2 == 0) {
    cat('*')
  } else {
    for (j in 1:n) {
      cat('*')
    }
  }
  cat('\n')
}

# ----------------------------
star_pri <- function(n){
  for(i in 1:n){
    for(j in 1:n){
      cat('*')
    }
    cat('\t')
    
    for(k in 1:n){
      if (k<=i){
        cat('*')
      }else{
        cat(' ')
      }
    }
    cat('\t')
    
    if (i%%2==1){
      cat('*****')
    }else{
      cat('*')
    }
    cat('\n')
  }
}
star_pri(5)



















