
t = 0:0.01:10;
x0 =  1.5;
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)for_q2(t,x), t, x0, optPos);

fig = figure();
plot(tP, x);
hold on;
grid on
title("y(\tau)");