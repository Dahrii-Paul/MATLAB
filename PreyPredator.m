function drdt = PreyPredator(t,r)
alpha = 1.0;
beta  = 1.0;
gamma = 1.0;
delta = 1.0;
x = r(1);
y = r(2);
drdt =[alpha*x - beta*x*y;  gamma*x*y - delta*y]
