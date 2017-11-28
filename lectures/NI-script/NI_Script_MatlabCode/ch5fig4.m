clear all
close all

x = 0:.01:10;
figure(1)

%%
y_gam_11 = pdf('gam',x,1,1);
subplot(2,3,1)
p1 = plot(x,y_gam_11,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_11)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=1, \beta=1','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')

%%
y_gam_21 = pdf('gam',x,2,1);
subplot(2,3,2)
p1 = plot(x,y_gam_21,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_21)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=2, \beta=1','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')

%%
y_gam_41 = pdf('gam',x,4,1);
subplot(2,3,3)
p1 = plot(x,y_gam_41,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_41)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=4, \beta=1','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')

%%
y_gam_12 = pdf('gam',x,1,2);
subplot(2,3,4)
p1 = plot(x,y_gam_12,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_12)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=1, \beta=2','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')

%%
y_gam_22 = pdf('gam',x,2,2);
subplot(2,3,5)
p1 = plot(x,y_gam_22,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_22)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=2, \beta=2','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')

%%
y_gam_42 = pdf('gam',x,4,2);
subplot(2,3,6)
p1 = plot(x,y_gam_42,'Color','red','LineWidth',2);
axis([0 8 0 max(y_gam_42)*1.1]);
% xlabel('x','FontSize',16);
% ylabel('y','FontSize',16);
h=title('\alpha=4, \beta=2','FontSize',16);
set(gca,'FontSize',16);
set(h,'interpreter','tex')