clear all
close all

n = 107; % number of trials

x = 1:50;
y = round((randn(n,1)*5)+30);

figure(1)
hist(y,x)
xlabel('age','FontSize',16)
ylabel('n','FontSize',16)
set(gca,'FontSize',16)