function Nt = log_growth(t, N0, r, K)

 % Define parameters for logistics growth

 % Nt = population growth
 % N0 = population size ;
 % r = intrinsic growth rate (a constant)
 % t = time period for populatin growth is calculated
 % K = carrying capactiy (max population)
 
 Nt = K ./ (1 + ((K-N0)/N0) * exp(-r * t));



end