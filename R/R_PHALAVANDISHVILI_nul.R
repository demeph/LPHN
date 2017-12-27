# Fonction Crible d'Eratosthène en R (pas optimal)
# @author Mahier Loïc & PHALAVANDISHVILI Demetre

nbPremier <- function(n) 
{ 
	# on crée un vector de booléen initialisé à TRUE
	v <- !vector("logical", n) 
	# on sait que 1 n'est pas un nombre premier
	v[1] <- FALSE
	# on parcourt le vector à partir de i = 2 jusqu'a i²
	# car une fois à i² on a déjà mis à FALSE tous les nom-premiers
	# (voir algo sur wikipedia par exemple)
	i <- 2 
	while (i*i <= n)
	{
		# si i premier on met à FALSE les multiples
		if (v[i]) 
		{
			v[seq(i*i, n, i)] <- FALSE
		}
		i <- i + 1
	}
	# on récupère les nombres premiers
	for(j in 1:n) {if (v[j]) t <- c(t, j)}
	return (t)
}


CJehanno <- function(limit){
  list = seq(2,limit,1)			### je génère tout #Opti
  aEnlever = c()						### future liste à remove
  for (x in list){
    for(y in list){
      if(x!=y){													### en parcourant tout si je me rend
        if(y%%x==0){										### compte qu'il y a un multiple je
          aEnlever <- c(aEnlever, y)		### l'ajoute dans les trucs à enlever
        }
      }
    }
    list <- list[!list %in% aEnlever]		###	avant de passer au prochaine j'enlève tous les multiples
  }
  return(list)
}


  tabN = c(10,100,1000,10000,100000)
  mesureNous = c(1:length(tabN))
  for(i in 1:length(tabN)){
    temp = 0;
    for(j in 1:10) {
      temp = temp + system.time(nbPremier(tabN[i]))
    }
    mesureNous[i] = temp/10;
  }

  mesureEux = c(1:length(tabN))
  for(i in 1:length(tabN)){
    temp = 0;
    for(j in 1:10) {
      temp = temp + system.time(CJehanno(tabN[i]))
    }
    mesureEux[i] = temp/10;
  }
