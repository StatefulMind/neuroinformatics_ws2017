clear all
close all

x = -10:.01:10;
sigm = @(shift) 0.5.*(1+tanh(5*(x-shift)))

y = [];
for k = 1:11
    y(:,k) = sigm(-1.2+k*0.2);
end


figure(1)
for l = 1:k
   plot(x,y(:,l),'LineWidth',2)
   hold all
end
axis([-1 1 0 1])
xlabel('x','FontSize',16)
set(gca,'FontSize',16)