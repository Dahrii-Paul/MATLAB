function xvec = randomWalk_1d(p,N)
step = 1;
xvec(1) = 0;
for step = 2:1:N
    r = rand(1,1);
    if (r < p)
        xvec(step)  = xvec(step-1) -1;
    else 
        xvec(step) = xvec(step-1) + 1;
    end
end
