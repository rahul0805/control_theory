function x_dot = linear_sys(t,x,A,B,K)
%% The file is for the linear dynamics model formed over origin
p = 10;
v = -0.2;

x_bar = [0;0;p+(v*t);v];
u = K*(x-x_bar);

x_dot = (A*x+(B*u));
end

