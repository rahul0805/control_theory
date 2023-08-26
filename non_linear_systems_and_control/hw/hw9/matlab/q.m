%% q1
b = 3; % value of b
c = 0.5; % value of c
d = 1.5; % value of d
A = [0,1,0,0;
    1,0,0,0;
    0,0,0,1;
    -1,0,0,0]; % Linearized value of A over origin

B = [0;-1;0;b]; % Linearized value of B over origin

%% Problem 1
t = 0:0.01:30;
x0 = [0;0;10;-0.2]; 
K = [0,0,0,0];
[t_lin,y_lin] = ode45(@(t,x) linear_sys(t,x,A,B,K), t, x0); % output of linear system
[t_ref,y_ref] = ode45(@(t,x) ref_linear(t,x), t, x0); 

% plotting  for Non linear estimate vs real
txt_1 = 'no_input';
txt_2 = 'ref';
init = num2str(x0);
saver(t_lin,y_lin, t_ref,y_ref, txt_1, txt_2, init);

%% Problem 2
p = [-3,-2, -0.7+((1j)*0.2),-0.7-((1j)*0.2)]; % Desired eigen values
K = -place(A,B,p); 
t = 0:0.01:100;
x0 = [0;0;9.8;-0.1]; 
% K = [0,0,0,0];
[t_lin,y_lin] = ode45(@(t,x) linear_sys(t,x,A,B,K), t, x0); % output of linear system
x0 = [0;0;10;-0.2];
[t_ref,y_ref] = ode45(@(t,x) ref_linear(t,x), t, x0); 

% plotting  for Non linear estimate vs real
txt_1 = 'with_input';
txt_2 = 'ref';
init = num2str(x0);
saver(t_lin,y_lin, t_ref,y_ref, txt_1, txt_2, init);

%% Problem 3

p = [-3,-2, -0.7+((1j)*0.2),-0.7-((1j)*0.2)]; % Desired eigen values
K = -place(A,B,p); 

esp = 0.01;

t = 0:0.01:100;
x0 = [0;0;10;0];

[t_lin,y_lin] = ode45(@(t,x) linear_sys_exp(t,x,A,B,K,esp), t, x0); % output of linear system

x0 = [0;0;10;-esp*10];
[t_ref,y_ref] = ode45(@(t,x) ref_exp(t,x,esp), t, x0); 

% plotting  for Non linear estimate vs real
txt_1 = 'with_input';
txt_2 = 'ref_exp';
init = num2str(x0);
saver(t_lin,y_lin, t_ref,y_ref, txt_1, txt_2, init);

