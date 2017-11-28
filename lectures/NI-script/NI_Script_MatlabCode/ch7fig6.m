clear all
close all

%% c^{-1}

x1 = .25:.001:.5;
x1 = x1(1:length(x1)-1);
pp1 = ((x1-.55).*2).^3+.5;

x1b = .5:.001:.7;
pp1b = (x1b-.5).^2-((x1b-.5).*3).^3.-x1b+1.1;

figure
subplot(2,2,1)
plot(x1,pp1,'Color','red','LineWidth',2)
hold on
plot(x1b,pp1b,'Color','blue','LineWidth',2)
axis([0 1 0 1])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('C^{-1}','FontSize',16)
set(gca,'FontSize',16)

%% C^0

x2 = .25:.001:.5;
x2 = x2(1:length(x2)-1);
pp2 = ((x2-.55).*2).^3+.5;

x2b = .5:.001:.7;
pp2b = (x2b-.5).^2-((x2b-.5).*3).^3.-x2b+0.9989;

subplot(2,2,2)
plot(x2,pp2,'Color','red','LineWidth',2)
hold on
plot(x2b,pp2b,'Color','blue','LineWidth',2)
axis([0 1 0 1])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('C^{0}','FontSize',16)
set(gca,'FontSize',16)

%% C^1

x=.5;
y=.5;
r=.3;
ang=1.5*pi:0.01:1.9*pi; 
xp=r*cos(ang);
yp=r*sin(ang);

x2=.5;
y2=.5;
r2=.3;
ang2=.5*pi:0.01:0.9*pi; 
xp2=r2*cos(ang2);
yp2=r2*sin(ang2);

x3 = .3:.001:.7;
y3 = ones(1,length(x3))/2;

subplot(2,2,3)
plot(x+xp,y+yp+.3,'Color','blue','LineWidth',2)
hold on
plot(x2+xp2,y2+yp2-.3,'Color','red','LineWidth',2)
plot(x3,y3,'Color','black','LineWidth',1)
axis([0 1 0 1])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('C^{2}','FontSize',16)
set(gca,'FontSize',16)

%% C^2

x=.5;
y=.5;
r=.3;
ang=0.1*pi:0.01:.5*pi; 
xp=r*cos(ang);
yp=r*sin(ang);

x2=.5;
y2=.5;
r2=.3;
ang2=.5*pi:0.01:0.9*pi; 
xp2=r2*cos(ang2);
yp2=r2*sin(ang2);

subplot(2,2,4)
plot(x+xp,y+yp,'Color','blue','LineWidth',2)
hold on
plot(x2+xp2,y2+yp2,'Color','red','LineWidth',2)
axis([0 1 0 1])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('C^{2}','FontSize',16)
set(gca,'FontSize',16)
