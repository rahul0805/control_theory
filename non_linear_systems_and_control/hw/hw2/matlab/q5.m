t = [0, 1];

x0 = 1;

optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, xP] = ode45(@(t,x)cmap(t,x), t, x0, optPos);

x = zeros(101,1);
x(1) = 1;
delta = 0.01;
t = 0:0.01:1;
for i = 1:10
    for j = 2:101
        x(j) = x(1) + delta*sum(sin(x(1:j))); 
    end
end
% plot(tP,xP);
% title("Using ODE");
% hold on
plot(t,x)
title("contraction mapping");
