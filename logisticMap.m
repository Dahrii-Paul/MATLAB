function xnew  =  logisticMap(n, x0, alpha)
xvec(1) = x0
for t = 2:1:n
    xvec(t) = alpha * xvec(t-1) * ( 1.0 - xvec(t-1))
end
xnew = xvec