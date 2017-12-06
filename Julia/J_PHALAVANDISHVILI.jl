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

prog_principale(1000000000)
