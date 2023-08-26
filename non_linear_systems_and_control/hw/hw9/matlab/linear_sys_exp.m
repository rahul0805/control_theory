function x_dot = linear_sys_exp(t,x,A,B,K,esp)
%% The file is for the linear dynamics model formed over origin
% p = 10;
% v = -0.2;
% 
% x_bar = [0;0;p+(v*t);v];

x_bar= [0;0;10*exp(-esp*t);-esp*10*exp(-esp*t)];

u = K*(x-x_bar);

x_dot = (A*x+(B*u));
end

