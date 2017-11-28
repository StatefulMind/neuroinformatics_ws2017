clear all
close all

%%
% ##################################
% 1) CREATING AN UNDERLYING FUNCTION
% ##################################

y_underlying = @(x) sin(x.*2*pi*1.37)

xreal = 0:.001:1;
yreal = y_underlying(xreal);

%%
% ########
% 2) MODEL
% ########

n_orders = 4;
n_sample = 28;                                            % sample size for training data
nvar = .2;                                                % variance in noise
n_trials = 2000;

% order of highest polynomial basis function

ym = [zeros(n_orders,length(xreal))];
ym_rec = [zeros(length(xreal),n_trials,n_orders)];

for l = 1:n_orders
order = 2*l-1;
        
for trial = 1:n_trials
    
    % ###################
    % 2A) DATA GENERATION
    % ###################
    
    xsample = sort(rand(n_sample,1));
    ysample = y_underlying(xsample); % the underlying model
    noise = randn(size(xsample)).*nvar;                       % the noise
    f = ysample+noise;                                        % the resulting sample
    
        % design matrix for estimation of weights
        d_mat = zeros(2*order+1,length(xsample));
        for k = 0:order
            d_mat(k*2+1,:) = sin(xsample.*2*pi*k+1);
            d_mat(k*2+2,:) = cos(xsample.*2*pi*k+1);
        end
        
        % estimation of weights (based on 'n_sample (e.g. =20) samples')
        [weights] = glmfit(d_mat',f');
        
        % design matrix for smooth visual display of fit (1k-10k sample points)
        d_mat_mod = zeros(2*order+1,length(xreal));
        for k = 0:order
            d_mat_mod(k*2+1,:) = sin(xreal.*2*pi*k+1);
            d_mat_mod(k*2+2,:) = cos(xreal.*2*pi*k+1);
        end
        
        % calculating predictions of our model fit (for 1k-10k sample points)
        ymodel = glmval(weights,d_mat_mod','identity');

        % recording the individual trials
        ym_rec(:,trial,l) = ymodel;
        
        % plot models
        figure(1)
        if trial <= 12
            subplot(2,n_orders,l)
            if trial == 1
                plot(xreal,yreal,'Color','black','LineWidth',2)
                hold all
            end
            plot(xreal,ymodel,'Color','red','LineWidth',1)
            axis([0 1 -3 3])
            ylabel('t','FontSize',16)
            title(order,'FontSize',16)
            set(gca,'FontSize',16)
        end
        
        trial
end

    ym = [];
    ym = mean(ym_rec(:,:,l),2);

    figure(1)
    subplot(2,n_orders,n_orders+l)
    plot(xreal,yreal,'Color','black','LineWidth',2)
    hold all
    plot(xreal,ym,'Color','red','LineWidth',2)
    axis([0 1 -3 3])
    ylabel('t','FontSize',16)
    title(order,'FontSize',16)
    set(gca,'FontSize',16)
    hold off
    
end