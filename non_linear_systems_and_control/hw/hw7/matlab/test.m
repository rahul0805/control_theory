x = -2.5:0.1:3.5;
y = -4:0.1:4;
[X,Y] = meshgrid(x,y);

xs = 0.707;
ys = 0;

X_dot = Y;

F = ((0.5*(Y.*Y) -2*(cos(X)-cos(xs)) - 1.3*(X-xs)));

G = (((Y.*(-2*sin(X)- 0.5*Y + 1.3)) +2*(sin(X).*Y) - 1.3*(Y)));

R = sqrt((X-xs).^2 + (Y-ys).^2);
figure();
contour(X,Y,F,100);
