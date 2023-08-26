t = 0:0.01:50;
global threshold;
x_init = pi/4;
threshold = 0.1;

x0 = [x_init;0;0;0]; % 0.69 is the limit
result = val_lyaponov(x0);
tend = 0;
xend = x0;
x_tot = [];
if(result==1)
    Opt    = odeset('Events', @myEvent);
    [t_lin,x_lin] = ode45(@(t,x) swing_pend(t,x), t, x0, Opt); % output of linear system
    tend = t_lin(end);
    xend = x_lin(end,:);
    x_tot = [x_tot;x_lin];
end

result = val_lyaponov(xend);
if(result==0)
    x0_new = [xend(1);xend(2);xend(3);xend(4)]; 
    [t_fin,x_fin] = ode45(@(t,x) better_dyn(t,x), t, x0_new); % output of linear system
    x_tot = [x_tot;x_fin(:,1:4)];
end

plot(x_tot(:,1))
hold on
plot(x_tot(:,2))
legend('x_1','x_2');
figure();
plot(x_tot(:,3))
hold on
plot(x_tot(:,4))
legend('x_3','x_4');

% figure();
% plot(x_fin(:,5));
% hold on;
% plot(x_fin(:,6))
% legend('zeta_1','zeta_2');


function [value, isterminal, direction] = myEvent(t, x)
    value      = val_lyaponov(x);
    isterminal = 1;   % Stop the integration
    direction  = -1;
end

function result = val_lyaponov(z)
    global threshold;
    lyaponov = cos(z(1))-1 + ((z(2)*z(2))/2);
    result =1;
    if(lyaponov<threshold)
        result = 0;
    end
end