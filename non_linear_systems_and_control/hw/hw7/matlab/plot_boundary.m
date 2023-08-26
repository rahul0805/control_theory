
load('boundary_data');

plot(boundary_part1(1,:),boundary_part1(2,:),'k');
hold on;
plot(boundary_part2(1,:),boundary_part2(2,:),'k');
scatter(uep(1),uep(2),'r*');
scatter(sep(1),sep(2),'b*');
axis(set_axis);
xlabel('x_1');
ylabel('x_2');
hold off;
