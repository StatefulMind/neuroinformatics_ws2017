clear all
close all

%%
% ###############################
% 1) CREATING AN UNDERLYING MODEL
% ###############################

xreal = 0:.001:1;
yreal = sin(xreal.*2*pi).*xreal.^2.*log(xreal)*3;

%%
% ###################
% 2) DRAWING A SAMPLE
% ###################

n_sample = 14; % sample size
nvar = .3; % variance in noise
xsample = sort(rand(n_sample,1));
ysample = sin(xsample.*2*pi).*xsample.^2.*log(xsample)*3;
noise = randn(size(xsample)).*nvar;
f = ysample+noise;

%%
% ###################
% 3) POLYNOMIAL MODEL 1
% ###################

% order of highest polynomial basis function
order = 2;

% design matrix for estimation of weights
d_mat = zeros(order+1,length(xsample));
for k = 0:order
    d_mat (k+1,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order+1,length(xreal));
for k = 0:order
    d_mat_mod (k+1,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel1 = glmval(weights,d_mat_mod','identity'); 

%%
% ###################
% 3) POLYNOMIAL MODEL 2
% ###################

% order of highest polynomial basis function
order = 4;

% design matrix for estimation of weights
d_mat = zeros(order+1,length(xsample));
for k = 0:order
    d_mat (k+1,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order+1,length(xreal));
for k = 0:order
    d_mat_mod (k+1,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel2 = glmval(weights,d_mat_mod','identity'); 

%%
% ###################
% 3) POLYNOMIAL MODEL 3
% ###################

% order of highest polynomial basis function
order = 10;

% design matrix for estimation of weights
d_mat = zeros(order+1,length(xsample));
for k = 0:order
    d_mat (k+1,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order+1,length(xreal));
for k = 0:order
    d_mat_mod (k+1,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel3 = glmval(weights,d_mat_mod','identity'); 

%%
% ###################
% 4) MORE DATA 1
% ###################

n_sample2 = 7; % sample size
xsample2 = sort(rand(n_sample2,1));
ysample2 = sin(xsample2.*2*pi).*xsample2.^2.*log(xsample2)*3;
noise2 = randn(size(xsample2)).*nvar;
f2 = ysample2+noise2;

%%
% ###################
% 5) MORE DATA 2
% ###################

n_sample3 = 7; % sample size
xsample3 = sort(rand(n_sample3,1));
ysample3 = sin(xsample3.*2*pi).*xsample3.^2.*log(xsample3)*3;
noise3 = randn(size(xsample3)).*nvar;
f3 = ysample3+noise3;

%%
% ###################
% 6) PLOT ALL
% ###################

figure(1)
subplot(3,3,1)
plot(xsample,f,'o','Color','blue','LineWidth',2)
hold all
plot(xreal,ymodel1,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,2)
plot(xsample,f,'o','Color','blue','LineWidth',2)
hold all
plot(xreal,ymodel2,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,3)
plot(xsample,f,'o','Color','blue','LineWidth',2)
hold all
plot(xreal,ymodel3,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,4)
plot(xreal,yreal,'Color','black','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,5)
plot(xsample2,f2,'o','Color','blue','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,6)
plot(xsample3,f3,'o','Color','blue','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,7)
plot(xreal,ymodel1,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,8)
plot(xreal,ymodel2,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(3,3,9);
plot(xreal,ymodel3,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)