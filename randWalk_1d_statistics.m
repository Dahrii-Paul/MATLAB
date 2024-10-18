function e2e = randWalk_1d_statistics(p,N,M)
for exp = 1:1:M
    x1 = randomWalk_1d(p,N);
    e2e(exp)=x1(N)-x1(1);
end
    