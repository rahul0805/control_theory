
%% Sub section 1
epsilon = 0.2;
samp = 10;

t = 0:0.01:30;

x0 = [-2.5;2.7];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)dyn(t,x,epsilon), t, x0, optPos);

x0 = [0.5;0.5];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x_new] = ode45(@(t,x)dyn(t,x,epsilon), t, x0, optPos);

x_dot1 = x(1:samp:end,2); 
x_dot11 = -x(1:samp:end,1) + epsilon*(1-(x(1:samp:end,1).*x(1:samp:end,1))).*x(1:samp:end,2);
x_dot2 = x_new(1:samp:end,2); 
x_dot21 = -x_new(1:samp:end,1) + epsilon*(1-(x_new(1:samp:end,1).*x_new(1:samp:end,1))).*x_new(1:samp:end,2);

fig = figure();
plot(x(:,1),x(:,2));
hold on;
quiver(x(1:samp:end,1),x(1:samp:end,2),x_dot1,x_dot11)
plot(x_new(:,1),x_new(:,2));
quiver(x_new(1:samp:end,1),x_new(1:samp:end,2),x_dot2,x_dot21)
axis equal
grid on
title("case a");

%% Sub section 2

epsilon = 1;

x0 = [1.9;3.5];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)dyn(t,x,epsilon), t, x0, optPos);
x_dot1 = x(1:samp:end,2); 
x_dot11 = -x(1:samp:end,1) + epsilon*(1-(x(1:samp:end,1).*x(1:samp:end,1))).*x(1:samp:end,2);

x0 = [0;0.01];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x_new] = ode45(@(t,x)dyn(t,x,epsilon), t, x0, optPos);
x_dot2 = x_new(1:samp:end,2); 
x_dot21 = -x_new(1:samp:end,1) + epsilon*(1-(x_new(1:samp:end,1).*x_new(1:samp:end,1))).*x_new(1:samp:end,2);

fig = figure();
plot(x(:,1),x(:,2));
hold on;
quiver(x(1:samp:end,1),x(1:samp:end,2),x_dot1,x_dot11)
plot(x_new(:,1),x_new(:,2));
quiver(x_new(1:samp:end,1),x_new(1:samp:end,2),x_dot2,x_dot21)
axis equal
grid on
title("case b");