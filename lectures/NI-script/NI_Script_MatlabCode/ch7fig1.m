clear all
close all

x = -1:.01:1;
poly = @(x,k)   x.^k;

y = [];
for k = 1:10
    y(:,k) = poly(x,k);
end


figure(1)
for l = 1:k
    plot(x,y(:,l),'LineWidth',2)
    hold all
end
axis([-1 1 -1 1])
xlabel('x','FontSize',16)
set(gca,'FontSize',16)