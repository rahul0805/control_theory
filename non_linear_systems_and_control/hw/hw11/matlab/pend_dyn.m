function z_dot = pend_dyn(t,z_in)
z = z_in;

E = cos(z(1))-1 + ((z(2)*z(2))/2);

u = E*z(2)*cos(z(1));

z_dot = [z(2) ; sin(z(1))-(cos(z(1))*u)];

end

