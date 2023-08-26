function op = swing_pend(t,z)

sigma = 1000;

E = cos(z(1))-1 + ((z(2)*z(2))/2);
u = (E*z(2)*cos(z(1))) - (sigma*z(4));

op = [z(2);sin(z(1))-(cos(z(1))*u);z(4);u];
end

