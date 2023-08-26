function z_dot = lin_sys(t,z)
u = (-3*z(3)) + (z(2)) + (2*z(1));

A = [-1,1,0;
    -1, -1, 1;
    -2, -2, 2];

B = [0;0;1];

z_dot = A*z + B*u;


end

