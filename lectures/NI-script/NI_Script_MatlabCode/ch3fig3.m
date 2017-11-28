close all
clear all

% discrete

x1 = -20:1.5:50;
z1 = normpdf(x1,10,3);
z1 = z1./max(z1)*100;

y1=[];
for k = 1:length(x1)
    for l = 0:round(z1(k))-1
        y1 = [y1,x1(k)];
    end
end

figure(1)
subplot(1,3,1)
hist(y1,x1)
axis([0 20 0 110])
xlabel('x','FontSize',16)
ylabel('n','FontSize',16)
title('discrete','FontSize',16)
set(gca,'FontSize',16)
set(get(gca,'child'),'FaceColor',[0.8,0.8,0.8],'EdgeColor','black')

% smaller bins

x2 = -20:0.5:50;
z2 = normpdf(x2,10,3);
z2 = z2./max(z2)*100;

y2=[];
for k = 1:length(x2)
    for l = 0:round(z2(k))-1
        y2 = [y2,x2(k)];
    end
end

subplot(1,3,2)
hist(y2,x2,'Color',[1,0.58,0])
axis([0 20 0 110])
xlabel('x','FontSize',16)
ylabel('n','FontSize',16)
title('discrete, smaller bins','FontSize',16)
set(gca,'FontSize',16)
set(get(gca,'child'),'FaceColor',[0.8,0.8,0.8],'EdgeColor','black')

% continuous 

xc = 0:.01:20;
yc = normpdf(xc,10,3);
yc = yc ./sum(yc);

subplot(1,3,3)
p1 = plot(xc,yc,'Color','black','LineWidth',2)
axis([0 20 0 max(yc)*1.1])
xlabel('x','FontSize',16)
ylabel('p','FontSize',16)
title('continuous','FontSize',16)
set(gca,'FontSize',16)