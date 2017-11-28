clear all
close all

% Note that this is not a 500-fold crossvalidation, but 500 one-fold
% crossvalidations, each on new training and testing data.

%%
% ###############################
% 1) CREATING AN UNDERLYING MODEL
% ###############################

xreal = 0:.001:1;
yreal = sin(xreal.*2*pi).*xreal.^2.*log(xreal)*3;

%%
% ###################
% 2) POLYNOMIAL MODEL
% ###################

order = 9
%n_sample = 30;                                            % sample size for training data
nvar = .2;                                                % variance in noise

% order of highest polynomial basis function

for trial = 1:2
    
    if trial == 1
        n_sample = 30;
    else
        n_sample = 3000;
    end
    
    % ###################
    % 2A) DATA GENERATION
    % ###################
    xsample = sort(rand(n_sample,1));
    ysample = sin(xsample.*2*pi).*xsample.^2.*log(xsample)*3; % the underlying model
    noise = randn(size(xsample)).*nvar;                       % the noise
    f = ysample+noise;                                        % the resulting sample

    n_sample2 = n_sample;                                         % sample size for testing data = size for training data
    xsample2 = sort(rand(n_sample2,1));
    ysample2 = sin(xsample2.*2*pi).*xsample2.^2.*log(xsample2)*3; % the underlying model
    noise2 = randn(size(xsample2)).*nvar;                         % the noise
    f2 = ysample2+noise2;                                         % the resulting sample

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

        %plot models
            figure(1)
            subplot(1,2,trial)
            plot(xsample,f,'o','Color',[0.7,0.7,0.7],'LineWidth',2)
            hold all
            plot(xreal,yreal,'Color','black','LineWidth',1)
            plot(xreal,ymodel,'Color','red','LineWidth',2)
            axis([0 1 -1.5 1.5])
            ylabel('t','FontSize',16)
            title(order,'FontSize',16)
            set(gca,'FontSize',16)
            hold off
        
        % training set error
        r = []; %residuals
        for j = 1:length(xsample)
           r(j)=ymodel(round(1000*xsample(j))+1)-f(j);
        end
        S_train(order+1,trial) = sum(r.^2); % sum of squared residuals

        % validation set error
        r = []; %residuals
        for j = 1:length(xsample2)
           r(j)=ymodel(round(1000*xsample2(j))+1)-f2(j);
        end
        S_test(order+1,trial) = sum(r.^2); % sum of squared residuals
end