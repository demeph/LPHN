nbPremier <- function(n) 
{ 
	v <- !vector("logical", n) 
	v[1] <- FALSE
	i <- 2 
	while (i*i <= n)
	{
		if (v[i]) 
		{
			v[seq(i*i, n, i)] <- FALSE
		}
		i <- i + 1
	}
	for(j in 1:n) {if (v[j]) t <- c(t, j)}
	return (t)
}