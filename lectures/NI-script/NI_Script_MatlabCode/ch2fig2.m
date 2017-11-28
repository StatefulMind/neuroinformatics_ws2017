clear all
close all

x = 0:.01:1;

y0 = ones(1,length(x));
y1 = x;
y2 = x.^2;
y3 = x.^3;

figure(1)
subplot(1,3,1)
plot(x,y0,'Color',[0.5,0.1,0.9],'LineWidth',2)
hold all
plot(x,y1,'Color','blue','LineWidth',2)
plot(x,y2,'Color','red','LineWidth',2)
plot(x,y3,'Color','magenta','LineWidth',2)
axis([0 1 -.1 1.1])
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
title('x^0; x^1; x^2; x^3','FontSize',16)
set(gca,'FontSize',16)
hold off

% fit one

fit_1 = 0.9*y0 +1.75*y1 -5.5*y2 +4*y3;

figure(1)
subplot(1,3,2)
plot(x,fit_1,'Color',[0,0.7,0],'LineWidth',2)
hold all
axis([0 1 .4 1.6])
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
title('y = 0.9 + 1.75*x - 5.5*x^2 + 4*x^3','FontSize',16)
set(gca,'FontSize',16)
hold off

% fit two

fit_2 = 11*y0 +1.5*y1 -1.1*y2 +0.1*y3;

figure(1)
subplot(1,3,3)
plot(x,fit_2,'Color',[1,0.5,0],'LineWidth',2)
hold all
axis([0 1 10.6 11.7])
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
title('y = 11 + 1.5*x - 1.1*x^2 + 0.1*x^3','FontSize',16)
set(gca,'FontSize',16)
hold off