function x_dot = nonlin_near(t,x,K, gains)

%% The file is for the nonlinear dynamics model

x_dot = zeros(6,1);
c = 0.5;
d = 1.5;
b = 3;
const = 1;
term = 1/(1+(c*sin(x(1))*sin(x(1))));


phi = x(1);
phi_dot = x(2);
s = x(3);
s_dot = x(4);

B = [0;(-cos(phi)*(term/const));0;(b*(term/const))];

x_dot(1) = phi_dot;
x_dot(2) = ((-c*phi_dot*phi_dot*sin(phi)*cos(phi))+sin(phi))*(term/const);
x_dot(3) = s_dot;
x_dot(4) = ((d*phi_dot*phi_dot*sin(phi))-(sin(phi)*cos(phi)))*(term/const);

y = [x(1);x(2);x(3)-x(5);x(4)-x(6)];
u = K*y;

x_dot(1:4) = x_dot(1:4) + (B*u);

alpha1 = gains(1);
K1 = gains(2);
alpha2 = gains(3);
K2 = gains(4);

beta1 = (-alpha1*x(5))/(1+(K1*abs(x(5))));
beta2 = (-alpha2*x(6))/(1+(K2*abs(x(6))));

x_dot(5) = x(6);
x_dot(6) = beta1 + beta2;

end

