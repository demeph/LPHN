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