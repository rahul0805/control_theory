t = 0:0.01:4;

x0 = [0.1;0];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)casea(t,x), t, x0, optPos);

fig = figure();
subplot(2,1,1)
plot(tP,x(:,1));
grid on
subplot(2,1,2)
plot(tP,x(:,2));
grid on

fig = figure();
plot(x(:,1),x(:,2));
grid on
