import time


def trouvePremiers(n):
    ensembles = set()
    prim = set()
    i = 2
    while i < n :
        if i not in ensembles :
            ensembles.update(range(i * i, n + 1, i))
            prim.add(i)
        i = i+1
    return  prim

t_avant = time.time()
print(sorted(trouvePremiers(15)))
t_apres = time.time()
print("temps d'execution : ",t_apres - t_avant)

