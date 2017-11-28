clear all
close all

x = 0:.01:10;
figure(1)

%%
y_chi2_1 = cdf('chi2',x,1);
y_chi2_2 = cdf('chi2',x,2);
y_chi2_3 = cdf('chi2',x,3);
y_chi2_4 = cdf('chi2',x,4);
y_chi2_5 = cdf('chi2',x,5);
p1 = plot(x,1-y_chi2_1,'Color','black','LineWidth',2,'DisplayName','k=1')
hold on
p2 = plot(x,1-y_chi2_2,'Color','blue','LineWidth',2,'DisplayName','k=2')
p3 = plot(x,1-y_chi2_3,'Color','green','LineWidth',2,'DisplayName','k=3')
p4 = plot(x,1-y_chi2_4,'Color','red','LineWidth',2,'DisplayName','k=4')
p5 = plot(x,1-y_chi2_5,'Color','magenta','LineWidth',2,'DisplayName','k=5')
axis([0 8 0 1])
i=xlabel('\chi^2','FontSize',16)
j=ylabel('p','FontSize',16)
set(gca,'FontSize',16)
set(i,'interpreter','tex')
set(j,'interpreter','tex')
legend('Location','NorthEast')
hold off
