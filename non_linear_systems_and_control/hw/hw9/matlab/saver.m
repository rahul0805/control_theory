function saver(t_lin,y_lin,t_ref, y_ref,txt_1, txt_2, init)
%% this file is a helper function to save the results
dir = './results/';
dir = strcat(dir,txt_1,'_',txt_2);

% plotting and saving phi
f = figure('visible','off');
plot(t_lin,y_lin(:,1));
hold on
plot(t_ref, y_ref(:,1));
hold off
legend(txt_1, txt_2);
title(strcat("phi with init ",init));
saveas(f,strcat(dir,'phi.png'));

% plotting and saving phi_dot
f = figure('visible','off');
plot(t_lin,y_lin(:,2));
hold on
plot(t_ref, y_ref(:,2));
hold off
legend(txt_1, txt_2);
title(strcat("/phi-{dot} with init ",init));
saveas(f,strcat(dir,'phi_dot.png'));

% plotting and saving s
f = figure('visible','off');
plot(t_lin,y_lin(:,3));
hold on
plot(t_ref, y_ref(:,3));
hold off
legend(txt_1, txt_2);
title(strcat("s with init ",init));
saveas(f,strcat(dir,'s.png'));

% plotting and saving s_dot
f = figure('visible','off');
plot(t_lin,y_lin(:,4));
hold on
plot(t_ref, y_ref(:,4));
hold off
legend(txt_1, txt_2);
title(strcat("s-dot with init ",init));
saveas(f,strcat(dir,'s_dot.png'));
end

