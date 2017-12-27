#Fonction pour le Crible d'Ératosthène.
#Groupe : Jehanno Clément, Caillaud Pierre, Duclos Romain

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
