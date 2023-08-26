%% Main file for whole project

M = 25; % mass
m = 20; % mass
L = 9.81; % length
g = 9.81; % gravity
J = (m*L*L)/3; % Intertia

b = ((M/m)+1)*((1/3)+1); % value of b
const = ((1/3)+(M/(m+M)))*(L/g); % 1/T^2
c = (m*m*L*L)/((J*(m+M))+(m*M*L*L)); % value of c
d = 1+c; % value of d

%% Problem 2 - Values from the calculation 

A = [0,1,0,0;
    1/const,0,0,0;
    0,0,0,1;
    -1/const,0,0,0]; % Linearized value of A over origin

B = [0;-1/const;0;b/const]; % Linearized value of B over origin

p = [-3,-2, -0.7+((1j)*0.2),-0.7-((1j)*0.2)]; % Desired eigen values

%% Problem 3: Place poles %%

controlability = [B,A*B, A*A*B, A*A*A*B];
rank_controlability = rank(controlability); % Problem 3  - Confirming the controlability of the system
K = -place(A,B,p); % Problem 3


%% Problem 5: Simuation of Linear and Non-linear system with K gain %%

t = 0:0.01:30;
x_init = 0.69;
x0 = [x_init;0;0;0]; % 0.69 is the limit

[t_lin,y_lin] = ode45(@(t,x) lin_sys(t,x,A,B,K,0,1), t, x0); % output of linear system
[t_nonlin,y_nonlin] = ode45(@(t,x) nonlin_sys(t,x,b,c,d,const,K,0,1), t, x0); % output of non-linear system


% simulation for Linear vs Non-Linear
txt_1 = 'linear-sys';
txt_2 = 'non-linear-sys';
init = num2str(x_init);
saver(t_lin,y_lin,y_nonlin, txt_1, txt_2,init)

%% Problem 6 - Observer design


C = [1,0,0,0;
    0,0,1,0;]; % Observer matrix

observability = [C;C*A];
rank_observability = rank(observability); % Problem 6  - Confirming the observability of the system

p_new = [-7,-6, -5,-4]; % Observer eigen values
L = place(A',C',p_new)'; % Problem 6  - Designing the observer

%% Problem 7 - observer design with linear system %%

x_init = 0.32; % 0.32 is the limit
t = 0:0.01:30;
x0 = [0;0;0;0;x_init;0;0;0]; 

% output of linear-observer and non-linear-real systems

[t_final,y_final] = ode45(@(t,x) q7(t,x,A,B,C,b,c,d,const,K,L), t, x0); 
[t_final_nothing,y_final_nothing] = ode45(@(t,x) q7(t,x,A,B,C,b,c,d,const,K,L*0), t, x0); 

% % Dividing the output 
y_lin_hat = y_final(:,1:4);
y_nonlin_real = y_final(:,5:8);

% plotting for Linear estimate vs real
txt_1 = 'linear-obs';
txt_2 = 'non-linear-real';
init = num2str(x_init);
saver(t_final,y_lin_hat,y_nonlin_real, txt_1, txt_2,init);
% 

% Dividing the output 
y_lin_hat = y_final_nothing(:,1:4);
y_nonlin_real = y_final_nothing(:,5:8);

% plotting for Linear estimate vs real
txt_1 = 'linear-static';
txt_2 = 'non-linear-real';
init = num2str(x_init);
saver(t_final_nothing,y_lin_hat,y_nonlin_real, txt_1, txt_2,init);

%% Problem 8 - observer design with non-linear system

x_init = 0.35; % 0.35 is the limit
t = 0:0.01:30;
x0 = [0;0;0;0;x_init;0;0;0]; % 0.96

% output of non-linear-observer and non-linear-real systems
% 
[t_final,y_final] = ode45(@(t,x) q8(t,x,A,B,C,b,c,d,const,K,L), t, x0); 

y_nonlin_hat = y_final(:,1:4);
y_nonlin_real = y_final(:,5:8);

% plotting  for Non linear estimate vs real
txt_1 = 'non-linear-obs';
txt_2 = 'non-linear-real';
init = num2str(x_init);
saver(t_final,y_nonlin_hat,y_nonlin_real, txt_1, txt_2, init);

% output of non-linear-observer and non-linear-real systems

[t_final,y_final_nothing] = ode45(@(t,x) q8(t,x,A,B,C,b,c,d,const,K,L*0), t, x0); 

y_nonlin_hat = y_final_nothing(:,1:4);
y_nonlin_real = y_final_nothing(:,5:8);

% plotting  for Non linear estimate vs real
txt_1 = 'non-linear-static';
txt_2 = 'non-linear-real';
init = num2str(x_init);
saver(t_final,y_nonlin_hat,y_nonlin_real, txt_1, txt_2, init);

