m = 20;
M = 25;
g = 9.81;
L = 9.81;


J = (1/3)*m*L*L; 

c = (m*m*L*L)/((J*(m+M))+(m*M*L*L));

d = 1+c;

b = ((M/m)+1)*((J/(m*L*L))+1);

bet =  ((1/3)+ (M/(m+M)))*(L/g);

req = 1/bet;
factor = L/(1+(M/m));
ip_factor = 