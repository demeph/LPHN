import time


def eratosthenes2(n):
    multiples = set()
    for i in range(2, n + 1):
        if i not in multiples :
            yield i
            multiples.update(range(i * i, n + 1, i))

t_avant = time.time()
print(list(eratosthenes2(15)))
t_apres = time.time()
print("temps d'execution : ",t_apres-t_avant)
