t = 0:0.01:4;

x0 = 1;
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)dyn_test(t,x), t, x0, optPos);

fig = figure();
plot(tP*10,x);
grid on
