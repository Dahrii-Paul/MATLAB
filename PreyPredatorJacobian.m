function j = PreyPredatorJacobian(r,pars)
alpha = pars(1); beta = pars(2); gamma = pars(3); delta= pars(4)
x=r(1); y= r(2);
j = [ alpha - beta*y   -beta*x ; gamma*y  gamma*x - delta]