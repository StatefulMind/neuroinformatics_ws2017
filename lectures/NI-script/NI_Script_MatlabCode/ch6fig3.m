clear all
close all

% ###############
% 1) Draw Samples
% ###############

n = 80;                 % number of participants
mu_pop = 182;           % population mean
sd_pop= 15;             % standard deviation in population

var_pop = sd_pop^2;     % population variance

y_sample = mu_pop-80:mu_pop+80;
x_sample = round((randn(n,1)*sd_pop)+mu_pop); % draw n samples from pop.

% #######################
% 2) Estimated Population
% #######################

mu_ML = mean(x_sample)              % µ_ML
s2_ML = var(x_sample)               % ?_ML^2
s2_ML_corr = var(x_sample)*n/(n-1)  % ?^2
sd_est = sqrt(s2_ML_corr)           % ?

ix = (mu_pop-100):(mu_pop+100);
iy_est = pdf('normal', ix, mu_ML, sd_est);

% ##################
% 3) Real Population
% ##################

iy_pop = pdf('normal', ix, mu_pop, sd_pop);

% #######
% 4) Plot
% #######

figure
subplot(1,3,1)
hist(x_sample,y_sample)
axis([mu_pop-60 mu_pop+60 0 max(hist(x_sample,y_sample))*1.1])
xlabel('body height','FontSize',16)
ylabel('n','FontSize',16)
title('N=80','FontSize',16)
set(gca,'FontSize',16)

subplot(1,3,2)
plot(ix,iy_est,'Color','red','LineWidth',2)
axis([mu_pop-60 mu_pop+60 0 max([max(iy_est),max(iy_pop)])*1.1])
xlabel('body height','FontSize',16)
ylabel('p','FontSize',16)
title('estimated population','FontSize',16)
set(gca,'FontSize',16)

subplot(1,3,3)
plot(ix,iy_pop,'Color','black','LineWidth',2)
hold all
plot(ix,iy_est,'Color','red','LineWidth',2)
axis([mu_pop-60 mu_pop+60 0 max([max(iy_est),max(iy_pop)])*1.1])
xlabel('body height','FontSize',16)
ylabel('p','FontSize',16)
title('red: estimated population; black: real population','FontSize',16)
set(gca,'FontSize',16)