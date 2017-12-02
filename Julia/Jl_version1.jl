function afficherPremier(n)
    return [ a for a in 2:n if lesbooleans[a] == true ]
end

function elimineMultiples(x,n)
    for i in (x+1):n
        if i%x == 0
            lesbooleans[i] = false
        end
    end
end

function trouvePremier(n)
    for i in 2:n
        if lesbooleans[i] == true
            elimineMultiples(i,n)
        end
    end
end

function prog_principale(n)
    global lesbooleans = fill(true,n)
    println(afficherPremier(n))
    trouvePremier(n)
    println("apres traitement")
    println(afficherPremier(n))
end

prog_principale(100)
