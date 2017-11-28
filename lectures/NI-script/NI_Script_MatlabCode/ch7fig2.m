clear all
close all

x = -1:.01:1;

y = [];
for k = 1:11
    y(:,k) = pdf('Normal',-1:.01:1,-1.2+0.2*k,.2)./2;
end


figure(1)
for l = 1:k
   plot(x,y(:,l),'LineWidth',2)
   hold all
end
axis([-1 1 0 1])
xlabel('x','FontSize',16)
set(gca,'FontSize',16)