clear all
close all

% #########
% 1) SAMPLE
% #########

x = [0.0119020695012414;0.0539501186666072;0.0758542895630636;...
     0.129906208473730;0.285839018820374;0.337122644398882;...
     0.351659507062997;0.380445846975357;0.469390641058206;...
     0.530797553008973;0.549723608291140;0.567821640725221;...
     0.568823660872193;0.585264091152724;0.753729094278495;...
     0.757200229110721;0.779167230102011;0.830828627896291;...
     0.917193663829810;0.934010684229183;];
       
t = [-5.32632952704015;-2.76310880554607;-5.13423201074049;...
     -4.60339861803915;-6.22174438426079;-5.05131094597675;...
     -6.05235095574945;-4.52812552605543;-3.18752129221983;...
     -1.05544755218143;-3.02106042467119;-5.04071637244840;...
     -3.46472974628074;-0.544193649813664;-0.836426551757584;...
     1.64338021520258;0.873481787155255;2.85741082659293;...
     -1.02907518849797;1.05032847625816;];

figure(1)                                  % plotting
plot(x,t,'o','Color','blue','LineWidth',2)
axis([0 1 -8 4])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('sample','FontSize',16)
set(gca,'FontSize',16)

% ################
% 2) MODEL FITTING
% ################

order = 4;                                  % order of highest polynomial
                                            % basis function

d_mat = zeros(order+1,length(x));           % setting up the design matrix
for k = 0:order
    d_mat (k+1,:) = x.^k;
end
d_mat = d_mat(2:end,:);                     % erase row for w_0 from d_mat
                                            % matlab automatically adds
                                            % this row in glmfit again

[w_ML] = glmfit(d_mat',t');                 % estimation of weights

% #######################
% 3) DISPLAY FITTED MODEL
% #######################

xreal = 0:.01:1;                            % needed for...

d_mat_mod = zeros(order+1,length(xreal));   % the design matrix for smooth
for k = 0:order                             % visual display of fitted mod.
    d_mat_mod (k+1,:) = xreal.^k;
end
d_mat_mod = d_mat_mod(2:end,:);             % erase row for w_0 from d_m_m
                                            % matlab automatically adds
                                            % this row in glmfit again

% predictions of our model fit

ymodel = glmval(w_ML,d_mat_mod','identity');% predictions of fitted model

figure(2)                                  % plotting
plot(x,t,'o','Color','blue','LineWidth',2)
hold all
plot(xreal,ymodel,'Color','red','LineWidth',2)
axis([0 1 -8 4])
xlabel('x','FontSize',16)
ylabel('t','FontSize',16)
title('blue: sample, red: fitted model','FontSize',16)
set(gca,'FontSize',16)
