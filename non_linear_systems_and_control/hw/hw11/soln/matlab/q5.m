z0 = [3*pi/4; 0;0;0];
t = 0:0.1:100;

[t_out,z] = ode45(@(t,z) swing_pend(t,z), t, z0); 
z_out = wrapToPi(z(:,1));


plot(z_out(:))
hold on
plot(z(:,2))
legend('x_1','x_2');
figure();
plot(z(:,3))
hold on
plot(z(:,4))
legend('x_3','x_4');
