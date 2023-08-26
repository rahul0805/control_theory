function x_dot = lin_dyn(t,x,A,B,K)
x_dot = (A*x) - (B*(K*x));
end

