close all
clear all

% functions

g       = @(x)          exp(0.01*x);
g_inv   = @(x)          100*log(x);
normal  = @(mu,sig,x)   1/(sqrt(2*pi*sig^2))*exp(-(x-mu).^2./(2*sig^2));
                        % This formula is simply the normal distribution formula.

x       = 0:.01:250; % range for the plotting
gx      = g(x);
gy      = g_inv(x); 

% PDFs

px      = normal(100,40,x);  % Here you can see how we implemented x=g(y): The x in the normal
pgy_inc = normal(100,40,gy); % distribution p_x(x) was simply replaced by g(y)=100*log(x):
                             % p_x(g(y)) = 1/(sqrt(2*pi*sig^2))*exp(-(100*log(x)-mu).^2./(2*sig^2))
                             % p_x(x)    = 1/(sqrt(2*pi*sig^2))*exp(-(         x-mu).^2./(2*sig^2))
                             
pgy     = normal(100,40,gy)./x.*100; % Let's not forget about |g'(x)| for the correct verion of p_y(y).

% Normalizing:
% The area under a PDF always sums up to 1, ergo we must normalize it.

px      = px./sum(px);
pgy_inc = pgy_inc./sum(pgy_inc);
pgy     = pgy./sum(pgy(2:length(pgy)));

% plotting

figure(1)
subplot(3,1,1)
plot(x,px,'DisplayName','p_x(x)','Color','black','LineWidth',2)
axis([0 250 0 max(px)*1.1])
xlabel('head count','FontSize',16)
ylabel('p(head count)','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthEast')

subplot(3,1,2)
plot(x,gx,'DisplayName','g(x)','Color','red','LineWidth',2)
axis([0 250 0 max(gx)*1.1])
xlabel('head count','FontSize',16)
ylabel('beer consumption','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthWest')

subplot(3,1,3)
plot(x,gy,'DisplayName','g^{-1}(x)','Color','blue','LineWidth',2)
axis([0 12 0 max(x)*1.1])
xlabel('beer consumption','FontSize',16)
ylabel('head count','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthWest')

figure(2)
subplot(3,1,1)
plot(x,pgy,'DisplayName','p_y(y)','LineWidth',2)
axis([0 10 0 max(pgy)*1.1])
xlabel('beer consumption per head','FontSize',16)
ylabel('p(beer consumption per head)','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthEast')

subplot(3,1,2)
plot(x,pgy_inc,'DisplayName','p_y(y) (incorrect)','Color','red','LineWidth',2)
axis([0 10 0 max(pgy)*1.1])
xlabel('beer consumption per head','FontSize',16)
ylabel('p(beer consumption per head)','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthEast')

subplot(3,1,3)
plot(x,pgy,'DisplayName','p_y(y)','LineWidth',2)
hold on
plot(x,pgy_inc,'DisplayName','p_y(y) (incorrect)','Color','red','LineWidth',2)
axis([0 10 0 max(pgy)*1.1])
xlabel('beer consumption per head','FontSize',16)
ylabel('p(beer consumption per head)','FontSize',16)
set(gca,'FontSize',16)
legend('Location','NorthEast')
hold off