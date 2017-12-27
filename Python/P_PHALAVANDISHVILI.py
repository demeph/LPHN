# Fonction Crible d'Eratosthène en Python
# @author Mahier Loïc & PHALAVANDISHVILI Demetre
import time


def trouvePremiers(n) :
    ensembles = set()
    nbPremiers = set()
    # on parcourt de 2 à n, on ignore 1 car on sait qu'il n'est pas premier
    i = 2
    while i < n:
        # on ajoute les mutiples non-premiers dans ensembles
    	# et les premiers dans nbPremiers
        if i not in ensembles :
            ensembles.update(range(i * i, n + 1, i))
            nbPremiers.add(i)
        i = i + 1
    return nbPremiers

def Pcaillaud( n ) :
#debut
  #On cree un dictionnaire avec comme clés les valeurs de 2 à n
  # et auquelles on asocie la valeur VRAI
  d = {}
  for x in range(2,n+1) : d[x] = True

  #Pour chaque valeur, si elle n'a pas déjà été éliminée,
  #on élimine ses multiples dans le dictionnaire des valeurs
  for i in d :
    if d[i] == True :
      for j in d :
        if j != i and d[j] == True and j % i == 0:
          d[j] = False

  # for x in d :
  #   if d[x] == True : print (x)
#end


#Pcaillaud(42)

vals = [10,100,1000,10000,100000]
mesureNous =[]
mesureEux = []

for i in vals:
    somme = 0
    for j in range(1,10):
        timeDeb = time.time()
        nb = trouvePremiers(i)
        timefin = time.time()
        somme += timefin-timeDeb
    mesureNous.append(somme/10)
print("mesure pour nous : ", mesureNous)
for i in vals:
    somme = 0
    for j in range(1,10):
        timeDeb = time.time()
        Pcaillaud(i)
        timefin = time.time()
        somme += timefin-timeDeb
    mesureEux.append(somme/10)
print("mesure pour eux  : ", mesureEux)

