clear all
close all

% ###############################
% 1) CREATING AN UNDERLYING MODEL
% ###############################

xreal = 0:.01:1;
yreal = sin(xreal*2*pi).*xreal.^2;

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
plot(xsample,f,'o','Color','blue','LineWidth',2)
axis([0 1 -.8 .5])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
set(gca,'FontSize',16)
