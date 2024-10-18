function Ex1_2

close all % close all previous graphics
clear all % clear the values of all variables

%%%% Mechanism (a)
p(1) = 1; % k1: production rate constant
p(2) = 1; % k2: degradation rate constant
x0   = 0.1; % set initial condition for A
tspan = [0 10]; % define time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_a,x_a] = ode45(@mech_a,tspan,x0,[],p);

clear p x0
%%%% Mechanism (b)
p(1) = 1; % Complex formation rate constant
p(2) = 1; % Complex disossiation rate constant
x0   = [0.1 0.1 0.1]; % initial conditions
tspan = [0 10]; % time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_b,x_b] = ode45(@mech_b,tspan,x0,[],p);

clear p x0
%%%% Mechanism (c)
p(1) = 1;     % Dimer-association rate constant
x0   = [0.1 0.1]; % initial conditions
tspan = [0 10]; % time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_c,x_c] = ode45(@mech_c,tspan,x0,[],p);

clear p x0
%%%% Mechanism (d)
p(1) = 1; % Modification rate constant
x0 = [0.1 0.1 0.1]; % initial conditions
tspan = [0 10]; % time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_d,x_d] = ode45(@mech_d,tspan,x0,[],p);

clear p x0
%%%% Mechanism (e)
p(1) = 1; % Dimer/Trimer-association rate constant
p(2) = 1; % Dimer/Trimer-dissociation rate constant
x0 = [0.1 0.1 0.1]; % initial conditions
tspan = [0 10]; % time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_e,x_e] = ode45(@mech_e,tspan,x0,[],p);

clear p x0
%%%% Mechanism (f)
p(1) = 1; % Modification rate constant of A
p(2) = 1; % Modification rate constant of B
p(3) = 1; % Signaling rate constant
x0 = [0.1 0.1 0.1 0.1]; % initial conditions
tspan = [0 10]; % time span of integration
% Call matlab integrator ode45 to solve the ODEs for (a)
[t_f,x_f] = ode45(@mech_f,tspan,x0,[],p);


% evoke a graphics object
figure(1)
% create a subplot in the 2 by 3 subplot matrix, in position 1
hold on

subplot(2,3,1)
plot(t_a,x_a)
title('mechanism (a)')
legend({'A'})

subplot(2,3,2)
plot(t_b,x_b)
title('mechanism (b)')
legend({'A','B','C'})

subplot(2,3,3)
plot(t_c,x_c)
title('mechanism (c)')
legend({'A','C'})

subplot(2,3,4)
plot(t_d,x_d)
title('mechanism (d)')
legend({'A','B','C'})

subplot(2,3,5)
plot(t_e,x_e)
title('mechanism (e)')
legend({'A','AA','AAA'})

subplot(2,3,6)
plot(t_f,x_f)
title('mechanism (f)')
legend({'A','A*','B','B*'})

hold off

end

function dxdt_a = mech_a(t,x,p)
k1  = p(1);
k2  = p(2);
dxdt_a = zeros(1,1);
dxdt_a(1) = k1-k2*x(1);
end

function dxdt_b = mech_b(t,x,p)
k1  = p(1);
k_1 = p(2);
dxdt_b = zeros(3,1);
dxdt_b(1) = -k1*x(1)*x(2) + k_1*x(3);
dxdt_b(2) = -k1*x(1)*x(2) + k_1*x(3);
dxdt_b(3) = k1*x(1)*x(2) - k_1*x(3);
end

function dxdt_c = mech_c(t,x,p)
k  = p(1);
dxdt_c = zeros(2,1);
dxdt_c(1) = -2*k*x(1)*x(1);
dxdt_c(2) = k*x(1)*x(1);
end

function dxdt_d = mech_d(t,x,p)
k1  = p(1);
dxdt_d = zeros(3,1);
dxdt_d(1) = 0;
dxdt_d(2) = -k1*x(1)*x(2);
dxdt_d(3) = k1*x(1)*x(2);
end

function dxdt_e = mech_e(t,x,p)
k1  = p(1);
k_1 = p(2);
dxdt_e = zeros(3,1);
dxdt_e(1) = -k1*x(1)*(2*x(1)+x(2)) + k_1*(2*x(2)+x(3));
dxdt_e(2) = k1*x(1)*x(1) + k_1*x(3) - x(2)*(k_1 + k1*x(1));
dxdt_e(3) = k1*x(1)*x(2) - k_1*x(3);
end

function dxdt_f = mech_f(t,x,p)
k1  = p(1);
k2  = p(2);
S   = p(3);
dxdt_f = zeros(4,1);
dxdt_f(1) = -k1*S*x(1);
dxdt_f(2) = k1*S*x(1);
dxdt_f(3) = -k2*x(2)*x(3);
dxdt_f(4) = k2*x(2)*x(3);
end

