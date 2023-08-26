x1_0 = 1;
x2_0 = 1;
x3_0 = 0.5;

z1_0 = x1_0;
z2_0 = x1_0 + x2_0;
z3_0 = x3_0 + 2*z2_0;

z0 = [z1_0; z2_0; z3_0];
t = 0:0.01:10;

[t_out,z] = ode45(@(t,z) lin_sys(t,z), t, z0); % output of linear system

[x1, x2, x3] = conv(z(:,1),z(:,2),z(:,3));

plot(x1);
hold on
plot(x2);
plot(x3);
legend('x_1','x_2', 'x_3');