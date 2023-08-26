function x_dot = q7(t,x,A,B,C,b,c,d,const,K,L)

% This is the file for the computation of obeserver model 
x_dot = zeros(8,1);

% splitting the inputs
x_hat_lin = x(1:4);
x_hat_real = x(5:8); 

x_dot_lin = lin_sys(t,x_hat_lin ,A,B,K,0,1); % linear system output
x_dot_real = nonlin_sys(t,x_hat_real,b,c,d,const,K,K*x_hat_lin,0); % non-linear output

y_hat_lin = C*x_hat_lin; % Linear system estimate observer 
y_hat_real = C*x_hat_real; % Non Linear system observer 

x_dot_lin = (x_dot_lin) + L*(y_hat_real-y_hat_lin); % Linear system observer correction 

% outputs
x_dot(1:4) = x_dot_lin;
x_dot(5:8) = x_dot_real;

end

