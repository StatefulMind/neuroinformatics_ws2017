close all
x = -20:0.01:20; 
y= (atan(x));
y = y+min(y);
y = y./min(y)
plot(x,y), grid on
set(gca,'Xtick',[-20 -10 0 10 20])
set(gca,'Xticklabel',[0 0.25 0.5 0.75 1])
xlabel('noise level')
ylabel('visibility')

figure
x=0:0.01:1
p2 = pdf('norm',x,0.3,0.1)
plot(x,p2./sum(p2))
set(gca,'Xlim',[0 1])
xlabel('noise level')
ylabel('p(noise level)')