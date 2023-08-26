function x_dot = nonlin_sys(t,x,b,c,d,const,K,u,check)

%% The file is for the nonlinear dynamics model

x_dot = zeros(4,1);
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

if (check==1)
    u = K*x;
end
x_dot = x_dot + (B*u);

end

