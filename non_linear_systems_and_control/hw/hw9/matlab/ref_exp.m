function x_dot = ref_exp(t,x,esp)
% x_dot = [0;0;10*exp(-esp*t);-esp*10*exp(-esp*t)];

x_dot = [0;0;-esp*10*exp(-esp*t);esp*esp*10*exp(-esp*t)];
end

