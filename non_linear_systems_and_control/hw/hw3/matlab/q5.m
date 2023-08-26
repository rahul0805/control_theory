%%values%%

cas = '1';

xx = [0;0;0;1];

% cas = '2';
% 
% xx = [0;0;1;1];

% cas = '3';
% 
% xx = [1;0;0;1]; 

%%
A = [0,(1/16.73),0,-(7.17/16.73),;
    7,0,0,0;
    0,0,0,1;
    0,0,0,0;
    ];
B = [0;0;0;1];
p = [(-1.7+(1j*1.5)),(-1.7-(1j*1.5)),-0.7,-0.35]';
K = place(A,B,p);

sig = (xx(3)*16.73) +(7.17*xx(4));
x0 = [xx(1);sig;xx(2);xx(4)];
% x0 = [0;0;1;1];
% x_new = [0;1;-(7.17/16.73);1;0];
% x_new = [0;0;-(7.17/16.73);1;0];
x_new = [xx(1);xx(2);xx(3);xx(4);sig];
t = 0:0.01:10;

[tP, xP] = ode45(@(t,x)lin_dyn(t,x,A,B,K), t, x0);
[tnP, xnP] = ode45(@(t,x)non_lin(t,x,B,K), t, x0);
[tcP, xcP] = ode45(@(t,x)comp(t,x,K), t, x_new);


fig = figure();
subplot(3,1,1);
plot(xP(:,1));
title("case 1");
hold on;
subplot(3,1,2);
plot(xnP(:,1));
title("case 2");
subplot(3,1,3);
plot(xcP(:,1));
title("case 3");
sgtitle('q_0');
savefig(['./results/q_0_' num2str(cas) '.fig'])

fig = figure();
subplot(3,1,1);
plot(xP(:,3));
title("case 1");
hold on;
subplot(3,1,2);
plot(xnP(:,3));
title("case 2");
subplot(3,1,3);
plot(xcP(:,2));
title("case 3");
sgtitle('q_1');
savefig(['./results/q_1_' num2str(cas) '.fig'])


