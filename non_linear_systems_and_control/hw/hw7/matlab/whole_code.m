x1 = 0.707
x2 = 0
% compute the jacobian symbollically

f = [x2; -2*sin(x1) - 0.5*x2 + 1.3];
jac = jacobian(f, [x1, x2]);
% evaluate the jacobian at the upright position
z0 = {0.7076 + 2*pi, 0};
jac_val = subs(jac, {x1, x2}, z0);
A = double(jac_val);
eig(A)
