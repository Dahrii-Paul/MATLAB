% S+E (k1)->(k_1) C->(k2) P+E
% dS/dt = -(k1*E*S)+ (k_1*C)
% dE/dt = -(k1*S*E) + (k_1*C) +(k2*C)
% dC/dt = (k1*S*E) - (k_1*C) - (k2*C) 
%%%% At steady state dC/dt~0
% dP/dt = (k2*C)
 
function [f] = dxdt(x)
%species:
S =  x(1);
E =  x(2);
P =  x(3);

k1=1;
k_1=1;
k2=1;
%E=E_t-C
E_t=1;

%dSdt  = (k_1*C)-(k1*E*S)
dSdt  = k_1*(E_t-E)-(k1*E*S);
%dPdt  = (k2*C);
dPdt  = k2*(E_t-E);
%dEdt  = (k_1*C) +(k2*C)-(k1*S*E);
dEdt  = k_1*(E_t-E) +k2*(E_t-E)-(k1*S*E);
%dC/dt = (k1*S*E) - (k_1*C) - (k2*C) 
f =[dSdt; dEdt; dPdt];
end





