clear all
close all

xdata = [1,2,3];
ydata = [3.2,2.2,3.0];

x = 0:.05:4;
y = 6.0 - 3.7*x + 0.9*x.^2;

figure(1)
plot(x,y,'red','LineWidth',2)
hold all
plot(xdata,ydata,'o','Color','blue','LineWidth',2)
axis([0 4 0 8])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('data points and fitted model: y = 6.0 - 3.7x + 0.9x^2','FontSize',16)
set(gca,'FontSize',16)
hold off