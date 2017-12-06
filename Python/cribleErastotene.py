# Fonction Crible d'Eratosthène en Python
# @author Mahier Loïc & PHALAVANDISHVILI Demtre

def trouvePremiers(n):
    ensembles = set()
    nbPremiers = set()
    # on parcourt de 2 à n, on ignore 1 car on sait qu'il n'est pas premier
    i = 2
    while i < n :
    	# on ajoute les nom-premiers dans ensembles
    	# et les premiers dans nbPremiers
        if i not in ensembles :
            ensembles.update(range(i * i, n + 1, i))
            nbPremiers.add(i)
        i = i + 1
    return nbPremiers

# on affiche le set
print(sorted(trouvePremiers(15)))