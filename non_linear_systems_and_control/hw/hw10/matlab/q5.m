A = [0,1,0,0;
    1,0,0,0;
    0,0,0,1;
    -1,0,0,0]; % Linearized value of A over origin
B = [0;-1;0;3]; % Linearized value of B over origin
p = [-3,-2, -0.7+((1j)*0.2),-0.7-((1j)*0.2)]; % Desired eigen values
K = -place(A,B,p); % Problem 3
%%
t = 0:0.01:60;
x_init = pi/2.1;
% gains = [0.59;1.525];
% gains = [1.59;0.525];;8
gains = [0.05;0.1];
x0 = [x_init;0;0;0]; 
[t_lin,x_lin] = ode45(@(t,x) nonlin_later(t,x,K,gains), t, x0); % output of linear system

plot(x_lin(:,1))
hold on
plot(x_lin(:,2))
legend('x_1','x_2');
figure();
plot(x_lin(:,3))
hold on
plot(x_lin(:,4))
legend('x_3','x_4');

