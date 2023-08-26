function x_dot = dyn(t,x)
x_dot = [x(2); (-2*sin(x(1)))- (0.5*x(2)) + 1.3];
end

