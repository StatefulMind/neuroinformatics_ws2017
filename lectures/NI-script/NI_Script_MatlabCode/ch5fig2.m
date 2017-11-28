clear all
close all

x = -5:.01:5;
y = normpdf(x,0,1);
y = y ./sum(y);

figure
p1 = plot(x,y,'Color','red','LineWidth',2)
axis([-4 4 0 max(y)*1.1])
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
title('normal distribution','FontSize',16)
set(gca,'FontSize',16)