clear;
close all;

p_1 = dlmread('5.csv', ';', 1, 0);

nz = find(p_1(:,4));
p_1 = p_1(nz-1:end,:);
t = p_1(1,1);
p_1(:,1) = (p_1(:,1) - t) * 10^(-6);

angles = p_1(:,4);

tr_1 = abs(102.4204 - angles) <=2;


tr_2 = abs(cos(102.4204 * pi/180) * (-0.37 - p_1(:,2)) ...
+sin(102.4204 * pi/180)*(1.68 - p_1(:,3))) <= 0.02;


figure
plot(p_1(:,1), tr_2 + tr_1 + 1);
axis([0 p_1(end,1) 0.8 3.2])

%matlab2tikz('transitions.tex')
