clear all
close all

x = 0:.001:1;
figure(1)
subplot(2,1,1)
y = [];
for i = 1:3
    y(:,i) = sin(2*pi*i.*x);
    plot(x,y(:,i),'LineWidth',2)
    if i == 1
       hold all
    end
end
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(2,1,2)
z = [];
for i = 1:3
    z(:,i) = cos(2*pi*i.*x);
    plot(x,z(:,i),'LineWidth',2)
    if i == 1
       hold all
    end
end
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
set(gca,'FontSize',16)