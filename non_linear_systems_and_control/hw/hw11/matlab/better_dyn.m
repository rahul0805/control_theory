function op = better_dyn(t,z)

sigma = 1000;
% 
% E = cos(z(1))-1 + ((z(2)*z(2))/2);
% u = (E*z(2)*cos(z(1))) - (sigma*z(4));

k = [19.3000, 22.9750, 1.5900, 5.5250];
k1 = k(1);
k2 = k(2);
k3 = k(3);
k4 = k(4);

u = ((k1*z(1) + k2*z(2))/cos(z(1))) + (k3*z(3)/(1+abs(z(3)))) + (k4*z(4)/(1+abs(z(4))));  

op = [z(2);sin(z(1))-(cos(z(1))*u);z(4);u];
end

