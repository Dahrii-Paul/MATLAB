function xvec = logisticMapPlot(n,alpha)
m=10
nvec = 1:1:n

for i = 1:1:m
    x0 = 1.0/i
    display x0, alpha
    if (i == 1)
        x2 = logisticMap(n,x0,alpha)
    else
        x2 = [x2;logisticMap(n,x0,alpha)]
    end
end
xvec = x2