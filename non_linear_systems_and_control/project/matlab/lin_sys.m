function x_dot = lin_sys(t,x,A,B,K,u,check)
%% The file is for the linear dynamics model formed over origin

if (check==1)
    u = K*x;
end
x_dot = (A*x+(B*u));
end

