function Ex1_3bc 
% This function has no input and no output; the only output for the user 
% will be what is plotted throughout the body of the function. 
% To run this function press the green arrow above or type exercise1
% in the command window


% Parameters
Etot = 1; % total enzyme concentration
k(1) = 1; % association rate k1
k(2) = 1; % dissociation rate k-1
k(3) = 1; % product formation rate k2

% Initial conditions (IC)
S0 = 10; % initial substrate concentration 
C0 = 0; P0 = 0;
x0 = [Etot S0 C0 P0]; % initial conditions

%
tspan = [0 30]; % integration boundaries

% integrate the ODEs
[t,x] = ode45(@enzymkinetics,tspan,x0,[],k);
E = x(:,1);
S = x(:,2);
C = x(:,3);
P = x(:,4);


% calculate Michaelis-Menten approximation
Km = (k(2)+k(3))/k(1);
Cm = Etot.*S./(Km + S);
Em = Etot - Cm;
Pm = S0 - S - Cm;


% Plotting
% plot results on linear time scale
figure(1)
subplot(1,2,1)
plot(t,E,'-r',t,S,'-g',t,C,'-b',t,P,'-k'); 
hold on
legend('Enzym','Substrate','Complex','Product')
plot(t,Em,':r',t,Cm,':b',t,Pm,':k'); hold off
%ylim([0 max([S0 Etot])])
xlabel('Time')
ylabel('Concentration')
title('(-) Full system, (.) Michaelis Menten approximation')

% plot results on log time scale
subplot(1,2,2)
plot(t,E,'-r',t,S,'-g',t,C,'-b',t,P,'-k'); 
hold on
legend('Enzym','Substrate','Complex','Product')
plot(t,Em,':r',t,Cm,':b',t,Pm,':k'); hold off
%ylim([0 max([S0 Etot])])
xlabel('Time')
ylabel('Concentration')
title('(-) Full system, (.) Michaelis Menten approximation')
set(gca,'XScale','Log')
xlim([1e-3 t(end)])


end


function dxdt = enzymkinetics(t,x,k)
% Right-hand-side function of an ODE system describing the basic enzymatic
% reaction:
% E + S <-> C -> E + P

dxdt = zeros(4,1); % I need to initialize my dxdt as a column vector of
% size 4, otherwise by default matlab stores it as a row vector and 
% later it complains about an error...

% here I just "translate" the x's in to something that makes it easier for
% me to write the ODEs below.I could also just skip this step and directly
% use the x's as I do for the k's
E = x(1); % enzym 
S = x(2); % substrate
C = x(3); % enzym-substrate complex
P = x(4); % product

dxdt(1) = -k(1)*E*S + C*(k(2) + k(3)); % dEdt
dxdt(2) = -k(1)*E*S + C*k(2); % dSdt
dxdt(3) = k(1)*E*S - C*(k(2) + k(3)); % dCdt
dxdt(4) = k(3)*C; % dPdt
end
