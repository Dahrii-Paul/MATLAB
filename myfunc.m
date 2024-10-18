function prob = myfunc(N,p)
i=1;
xvec(1)= 0; 
    for t=2:1:N
        k=rand(1);
        if k<p;
            xvec(t)=xvec(t-1)+1;
        else
            xvec(t)=xvec(t-1)-1;
        end
        k=xvec(t);
    not(i)=(1/sqrt(pi*t))*exp(-k^2/t);
    i=i+1;
    end
prob=not