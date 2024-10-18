function g(t_end)
t=0;
km=10;
kp=6;
dm=1;
dp=1;
M=5;
P=10;
j=1;
t_array(j)=t;
m_array(j)=M;
p_array(j)=P;
while t<t_end
    propensity=[km kp*M dm*M dp*P];
    propsum=sum(propensity);
    time_wait=-(1/propsum)*log(rand);
    t=t+time_wait;
    cuprob=cumsum(propensity)/propsum;
    k=rand;
    if k>=0 && k<=cuprob(1)
        M=M+1;
    elseif k>cuprob(1) && k<=cuprob(2)
        P=P+1;
    elseif k>cuprob(2) && k<=cuprob(3)
        M=M-1;
    else
        P=P-1;
    end
    j=j+1;
    t_array(j)=t;
    m_array(j)=M;
    p_array(j)=P;
end
plot(t_array,m_array),hold all;
plot(t_array,p_array),legend('M','P');
    