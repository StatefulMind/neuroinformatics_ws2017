close all
clear all

% discrete

x1 = 0:.4:8;
z1 = (15-x1-((x1-3).^2)).*(x1./5).^3;
%z1 = pdf('norm',x1,10,3);
%z1 = z1.*x1.^5;
z1 = z1./max(z1)*80;

y1=[];
for k = 1:length(x1)
    for l = 0:round(z1(k))-1
        y1 = [y1,x1(k)];
    end
end

figure(1)
hist(y1,x1)
axis([0 7 0 110])
set(gca,'FontSize',16)
set(get(gca,'child'),'FaceColor',[0.8,0.8,0.8],'EdgeColor','black')

% smooth continuous

x2 = 0:.001:8;
z2 = (15-x2-((x2-3).^2)).*(x2./5).^3;
z2 = z2./max(z2)*80;

figure(2)
plot(x2,z2,'Color','blue','LineWidth',2)
axis([0 7 0 110])
set(gca,'FontSize',16)

% continuous 

xc = 0:.01:20;
yc = normpdf(xc,10,3);
yc = cumsum(yc);
yc = yc ./sum(yc);

figure(3)
p1 = plot(xc,yc,'Color','black','LineWidth',2)
axis([0 20 -0.0001 max(yc)*1.1])
set(gca,'FontSize',16)
