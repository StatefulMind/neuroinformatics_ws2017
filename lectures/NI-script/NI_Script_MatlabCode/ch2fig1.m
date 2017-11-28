clear all
close all

% ###############################
% 1) CREATING AN UNDERLYING MODEL
% ###############################

xreal = 0:.01:1;
yreal = sin(xreal*2*pi).*xreal.^2;

figure(1)
subplot(1,4,1)
plot(xreal,yreal,'Color','black','LineWidth',2)
axis([0 1 -.8 .5])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('underlying function: µ(x)=sin(2*pi*x)*x^2','FontSize',16)
set(gca,'FontSize',16)

% ###################
% 2) DRAWING A SAMPLE
% ###################

n_sample = 20; % sample size
nvar = .2; % variance in noise
xsample = sort(rand(n_sample,1));
ysample = sin(xsample*2*pi).*xsample.^2;
noise = randn(size(xsample)).*nvar;
f = ysample+noise;

figure(1)
subplot(1,4,2)
plot(xsample,f,'o','Color','blue','LineWidth',2)
axis([0 1 -.8 .5])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('sample: f(x)=µ(x)+noise','FontSize',16)
set(gca,'FontSize',16)

% ###################
% 3) POLYNOMIAL MODEL
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

ymodel = glmval(weights,d_mat_mod','identity'); 

figure(1)
subplot(1,4,3)
plot(xsample,f,'o','Color','blue','LineWidth',2)
hold all
plot(xreal,ymodel,'Color','red','LineWidth',2)
axis([0 1 -.8 .5])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('blue: sample, red: model fit','FontSize',16)
set(gca,'FontSize',16)
hold off

% ###############################################
% 4) COMPARE POLYNOMIAL MODEL TO UNDERLYING MODEL
% ###############################################

figure(1)
subplot(1,4,4)
plot(xreal,yreal,'Color','black','LineWidth',2)
hold all
plot(xreal,ymodel,'Color','red','LineWidth',2)
axis([0 1 -.8 .5])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('red: model fit, black: underlying function','FontSize',16)
set(gca,'FontSize',16)
hold off