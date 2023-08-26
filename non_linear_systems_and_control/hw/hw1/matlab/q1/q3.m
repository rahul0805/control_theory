epsilon = 0.2;
t = 0:0.01:15;
samp =10;
x0 = [ 2.0379;    0.0223];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x] = ode45(@(t,x)dyn_new(t,x,epsilon), t, x0, optPos);

x0 = [-0.1693;   -1.7204];
optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);
[tP, x_new] = ode45(@(t,x)dyn_new(t,x,epsilon), t, x0, optPos);

x_dot1 = x(1:samp:end,2); 
x_dot11 = -x(1:samp:end,1) + epsilon*(1-(x(1:samp:end,1).*x(1:samp:end,1))).*x(1:samp:end,2);
x_dot2 = x_new(1:samp:end,2); 
x_dot21 = -x_new(1:samp:end,1) + epsilon*(1-(x_new(1:samp:end,1).*x_new(1:samp:end,1))).*x_new(1:samp:end,2);



fig = figure();
plot(x(:,1),x(:,2));
hold on;
quiver(x(1:samp:end,1),x(1:samp:end,2),-1*x_dot1,-1*x_dot11)
plot(x_new(:,1),x_new(:,2));
quiver(x_new(1:samp:end,1),x_new(1:samp:end,2),-1*x_dot2,-1*x_dot21)
axis equal
grid on