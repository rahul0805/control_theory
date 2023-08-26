function x_dot = non_lin(t,x,B,K)
v = -K*x;
x_dot = zeros(4,1);
bp = (7*cos(x(1))+9.73);
x_dot(1) = ((x(2)/bp) - (((3.67+(3.5*cos(x(1))))*x(4))/bp));
x_dot(2) = (7*sin(x(1))) - (3.5*sin(x(1))*x_dot(1)*(x_dot(1)+x(4)));
x_dot(3) = x(4);
x_dot(4) = v;
end

