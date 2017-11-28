clear all
close all

%%
% ###############################
% 1) CREATING AN UNDERLYING MODEL
% ###############################

xreal = 0:.001:1;
yreal = 3*(sin(xreal.*2*pi).*xreal.^2.*log(xreal)*3);

%%
% ###################
% 2) DRAWING A SAMPLE
% ###################

n_sample = 40; % sample size
nvar = .3; % variance in noise
xsample = sort(rand(n_sample,1));
ysample = 3*(sin(xsample.*2*pi).*xsample.^2.*log(xsample)*3);
noise = randn(size(xsample)).*nvar;
f = ysample+noise;

%%
% ###################
% 3) POLYNOMIAL MODEL 1
% ###################

% order of highest polynomial basis function
order = 15;
lambda1 = 0.001;
lambda2 = 0.0000000000004;

% design matrix for estimation of weights
d_mat = zeros(order,length(xsample));
for k = 1:order
    d_mat (k,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights1] = ridge(f,d_mat',lambda1,0);
[weights2] = ridge(f,d_mat',lambda2,0);
[weights0] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order,length(xreal));
for k = 1:order
    d_mat_mod (k,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel1 = glmval(weights1,d_mat_mod','identity'); 
ymodel2 = glmval(weights2,d_mat_mod','identity');  
ymodel0 = glmval(weights0,d_mat_mod','identity');

%%
% ###################
% 6) PLOT
% ###################

figure(1)
subplot(1,3,1)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xreal,ymodel0,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
str = sprintf('order = %f',order);
title(str,'FontSize',16)
set(gca,'FontSize',16)

subplot(1,3,2)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xreal,ymodel2,'Color','blue','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
str = sprintf('order = %f',order);
title(str,'FontSize',16)
set(gca,'FontSize',16)

subplot(1,3,3)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xreal,ymodel1,'Color','green','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
str = sprintf('order = %f',order);
title(str,'FontSize',16)
set(gca,'FontSize',16)

mean(sqrt(weights1.^2))
mean(sqrt(weights2.^2))
mean(sqrt(weights0.^2))