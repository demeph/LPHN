# Fonction Crible d'Eratosthène en Julia (optimal)
# @author Mahier Loïc & PHALAVANDISHVILI Demetre

function afficherPremier(n)
    return [ a for a in 2:n if lesbooleans[a] == true ]
end

function elimineMultiples(x,nbPrem,n)
    i = x
    while i <= n
        if lesbooleans[i]
            if i%nbPrem == 0
                lesbooleans[i] = false
            end
        end
        i = i + nbPrem
    end
end

function trouvePremier(n)
    for i in 2:n
        if lesbooleans[i]
            elimineMultiples(i*i,i,n)
        end
    end
end

function prog_principale(n)
    global lesbooleans = fill(true,n)
    println("affichage de 1 a ",n)
    println("-debut traitement")
    tdebut = time()
    trouvePremier(n)
    tfin = time()
    #println(afficherPremier(n))
    println("-fin traitement - tps traitement : ",tfin-tdebut," s")
end

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

function prog_test()
    #global lesbooleans = fill(true,n)
    #println("affichage de 1 a ",n)
    println("-debut traitement")
    somme = 0;
    vals = [10,100,1000,10000,100000,1000000]
    mesureNous = Array{Float16}(length(vals));
    mesureEux = Array{Float16}(length(vals));
    for i in 1:length(vals)
        somme = 0;
        for l in 1:10
            tdebut = time()
            global lesbooleans = fill(true,vals[i])
            trouvePremier(vals[i])
            tfin = time()
            somme = somme + (tfin-tdebut)
        end
        mesureNous[i] = somme/10
    end
    println("mesure pour nous : ",mesureNous)
    for i in 1:length(vals)
        somme = 0;
        for l in 1:10
            tdebut = time()
            num = eratos(vals[i])
            tfin = time()
            somme = somme + (tfin-tdebut)
        end
        mesureEux[i] = somme/10
    end
    println("mesure pour eux  : ",mesureEux)
end

prog_test()
