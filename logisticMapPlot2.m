function xvec = logisticMapPlot2(n,alpha)
m=10
nvec = 1:1:n

for i = 1:1:(m-1)
    x0 = i/m
    plot(nvec, logisticMap(n,x0,alpha))
    hold all
end