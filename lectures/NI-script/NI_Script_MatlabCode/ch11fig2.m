clear all
close all

count=1;
for k = [0.5 1 2 4]
    x=-1:0.01:1;
    y=(1-abs(x.^k)).^(1/k);
    
    xx=[x,x(end:-1:1)];
    yy=[y,-y];

    figure(1)
    subplot(1,4,count)
    plot(xx,yy,'Color','green','LineWidth',1)
    axis([-2 2 -2 2])
    xlabel('x','FontSize',16)
    ylabel('t','FontSize',16)
    set(gca,'FontSize',16)
    count = count+1;
end