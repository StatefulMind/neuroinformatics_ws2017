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

n_sample = 20; % sample size
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
order = 5;

% design matrix for estimation of weights
d_mat = zeros(order,length(xsample));
for k = 1:order
    d_mat (k,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights1] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order,length(xreal));
for k = 1:order
    d_mat_mod (k,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel1 = glmval(weights1,d_mat_mod','identity'); 

%%
% ###################
% 3) POLYNOMIAL MODEL 2
% ###################

% order of highest polynomial basis function
order = 10;

% design matrix for estimation of weights
d_mat = zeros(order,length(xsample));
for k = 1:order
    d_mat (k,:) = xsample.^k;
end

% estimation of weights (based on 'n_sample (e.g. =20) samples')
[weights2] = glmfit(d_mat',f');

% design matrix for smooth visual display of fit (1k-10k sample points)
d_mat_mod = zeros(order,length(xreal));
for k = 1:order
    d_mat_mod (k,:) = xreal.^k;
end

% calculating predictions of our model fit (for 1k-10k sample points)
ymodel2 = glmval(weights2,d_mat_mod','identity'); 

%%
% ###################
% 6) PLOT BOTH
% ###################

figure(1)
subplot(1,2,1)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xsample,f,'o','Color','blue','LineWidth',2)
plot(xreal,ymodel1,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

subplot(1,2,2)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xsample,f,'o','Color','blue','LineWidth',2)
plot(xreal,ymodel2,'Color','red','LineWidth',2)
axis([0 1 -2.5 2.5])
ylabel('t','FontSize',16)
set(gca,'FontSize',16)

weights1
weights2