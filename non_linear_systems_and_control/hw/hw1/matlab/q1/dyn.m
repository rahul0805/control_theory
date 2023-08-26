function x_dot = dyn(t,x,epsilon)
x_dot = [x(2); -x(1) + epsilon*(1-(x(1)*x(1)))*x(2)];
end

