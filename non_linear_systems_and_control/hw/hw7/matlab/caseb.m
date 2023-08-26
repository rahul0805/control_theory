function x_dot = caseb(t,x)
A = [0,1; -40, -4];
B = [0;4];
C = [0;40];
r = 0.01*cos(t);
r_dot = -0.01*sin(t);
x_dot = A*x + B*r_dot + C*r;
end

