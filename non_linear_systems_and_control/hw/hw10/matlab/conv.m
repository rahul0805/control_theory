function [x1,x2,x3] = conv(z1,z2,z3)
x1 = z1;
x2 = z2 - z1;
x3 = z3 - 2*z2;
end

