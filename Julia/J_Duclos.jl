#Fonction pour le Crible d'Ératosthène.
#Groupe : Jehanno Clément, Caillaud Pierre, Duclos Romain

function eratos(n)
	#je récupère les entiers de 1 à n
    num = [i for i in 1:n]
    #ensuite je prend les multiples jusqu'à la racine de n
    #pas besoin d'aller au dela (on revient sur des multiples deja vu apres)
    for j in 2:ceil(sqrt(n))
    	#je filtre mon tableau d'entiers pour chacun de mes multiples
        filter!(x-> if(x%j==0 && x!=j) !(x in [x]) else !(x in []) end, num)
    end
    #le tableau d'entiers final ne contient plus que les n premiers entiers
    return num
end