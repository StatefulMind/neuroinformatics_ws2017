clear all
close all

x = 0:.001:1;
y = [zeros(1,300),ones(1,400),zeros(1,301)];

plot(x,y,'Color','blue','LineWidth',2)
axis([0 1 -.2 1.8])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
set(gca,'FontSize',16)
