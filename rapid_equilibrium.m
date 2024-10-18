function f = rapid_equilibrium(t,x)
k1=0.05;
k2=0.7;
kn1=0.005;
kn2=0.4;

A =x(1);
B =x(2);
C =x(3);
% A <-> B <-> C
% a+b <-> c
% x <-> c
% a=(kn1/(kn1+k1)) * c;
% b=(k1/(k1+kn1)) * c;
% c=((kn1+k1)/kn1)*a;


f=zeros(3,1);

f(1)= -(k1*A) + (kn1*B);
f(2)= (k1*A)-(k2*B)+(kn2*C);
f(3)= (k2*B)-(kn2*C);