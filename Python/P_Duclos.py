#Fonction pour le Crible d'Ératosthène.
#Groupe : Jehanno Clément, Caillaud Pierre, Duclos Rom

def Pcaillaud( n ) :

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

  for x in d : 
    if d[x] == True : print (x)

Pcaillaud(42) # 2 3 5 7 11 13 17 19 23 29 31 37 41