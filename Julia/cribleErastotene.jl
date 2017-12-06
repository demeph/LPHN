# Fonction Crible d'Eratosthène en Julia (non-optimal !!)
# @author Mahier Loïc & PHALAVANDISHVILI Demtre

function afficherPremier(n)
    return [ a for a in 2:n if lesbooleans[a] == true ]
end

function elimineMultiples(x,n)
    for i in (x):(n-x)
        if lesbooleans[i+x]
            if i%x == 0
                lesbooleans[i+x] = false
            end
        end
    end
end

function trouvePremier(n)
    for i in 2:n
        if lesbooleans[i]
            elimineMultiples(i,n)
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
    println(afficherPremier(n))
    println("-fin traitement - tps traitement : ",tfin-tdebut," s")
end

prog_principale(15)
