
%% Sub section 1
epsilon = 0.2;
samp = 10;

t = 0:0.01:30;

optPos = odeset('RelTol', 1e-6, 'AbsTol',1e-6);

x = -2.5:0.5:3.5;
y = -2.5:0.5:3.5;
[X,Y] = meshgrid(x,y);

ind = size(X);

fig = figure();
for i=1:ind(1)
    for j=1:ind(2)
        
        x0 = [X(i,j);Y(i,j)];
        [tP, x_new] = ode45(@(t,x)dyn(t,x), t, x0, optPos);
        if((abs(x_new(end,1)-0.707)<0.1) && (abs(x_new(end,2))<0.1))
            hold on
            plot(x_new(:,1),x_new(:,2))
        end
        % quiver(x_new(1:samp:end,1),x_new(1:samp:end,2))
        
    end
end
hold off
axis equal
grid on

