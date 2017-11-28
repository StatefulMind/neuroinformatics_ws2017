close all
clear all

x = -10:.01:10;

y1 = normpdf(x,.3,.18);
y2 = normpdf(x,.75,.10);

y = y1+y2;
y = y ./sum(y);
ycum = cumsum(y).*max(y); % for prettier display > both curves same height

area_x = x;
area_x = area_x(1025:1040);
area_y = y;
area_y = area_y(1025:1040);

subplot(2,1,1)
p1 = plot(x,y,'DisplayName','p(x)')
set(p1,'Color','red','LineWidth',2)
hold all
axis([0 1.1 0 max(max(y),max(ycum))*1.1])
legend('Location','NorthWest')
area(area_x,area_y)
colormap hsv
set(gca,'FontSize',20)
hold off

subplot(2,1,2)
p2 = plot(x,y,'DisplayName','p(x)')
set(p2,'Color','red','LineWidth',2)
hold all
p3 = plot(x,ycum,'DisplayName','P(x)')
set(p3,'Color','blue','LineWidth',2)
axis([0 1.1 0 max(max(y),max(ycum))*1.1])
legend('Location','NorthWest')
colormap hsv
set(gca,'FontSize',20)
hold off