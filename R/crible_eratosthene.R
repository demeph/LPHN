nbPremier <- function(n) 
{ 
	t <- !vector("logical", n) 
	t[1] <- FALSE
	i <- 2 
	while (sqrt(i) <= n)
	{
		if (t[i] == TRUE) 
		{
			for (j in i+1:n) 
			{ 
				if ((j %% i) == 0) t[j] <- FALSE 
			}
		}
		i <- i + 1
	}
	return (t) 
}