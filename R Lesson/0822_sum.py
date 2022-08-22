n, m = map(int, input().split())
print(sum(range(n, m + 1)))


def mysum(n, m):
    return(m*(m-1) - n*(n-1)) // 2
n, m = map(int, input().split())
print(mysum(n, m ))

# 연산속도의 차이