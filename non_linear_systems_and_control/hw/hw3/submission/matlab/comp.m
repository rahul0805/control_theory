function x_dot = comp(t,x,K)

x_dot = zeros(5,1);
y = [x(1);x(5);x(2);x(4)];
aa = 3.67 + (3.5*(cos(x(1))));
a1 = (7*cos(x(1)))+9.73;
D = [a1, aa;
     aa, 3.67];
bb = -3.5*sin(x(1));
C = [bb*x(3),0;
    bb*x(3),0;];
G = [-7*sin(x(1));0];

B= [0;1];

cc = (7*cos(x(1))) + 9.73;
dd = (7+(3.5*x(3)*x(3)));
v = -K*(y);

u = (bb*x(3)*x(3)) + (sin(x(1))*(aa/cc)*dd) + ((3.67 - ((aa*aa)/cc))*v);

q_dot = [x(3);x(4)];
comp_1 = -inv(D)*((C*q_dot)+G);
comp_2 = inv(D)*B;

x_dot(1) = x(3);
x_dot(2) = x(4);

comp = comp_1 + (comp_2*u);

x_dot(3) = comp(1);
x_dot(4) = comp(2);

x_dot(5) = (7*sin(x(1))) - (3.5*sin(x(1))*x(3)*(x(3)+x(4)));

end

