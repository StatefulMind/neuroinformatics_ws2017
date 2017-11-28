clear all
close all

x = 0:.01:10;
y_exp = pdf('exp',x,1);

exp_s2 = [];
exp_s8 = [];
exp_s50 = [];

for j = 1:100000                                % 2) repeating this a 100.000 times/ 1m times
    exp_s2(j) = mean(random('exp',1,2,1));       % 1) Drawing TWO samples from the distribution and noting down their mean
    exp_s8(j) = mean(random('exp',1,8,1));       %            EIGHT
    exp_s50(j) = mean(random('exp',1,50,1));     %            FIFTY
end

%% Plotting

figure(1)
subplot(4,1,1)
p1 = plot(x,y_exp,'Color','red','LineWidth',2)
axis([0 4 0 max(y_exp)*1.1])
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
title('exponential distribution','FontSize',16)
set(gca,'FontSize',16)

exp_hist_x2 = 0:.05:5;
subplot(4,1,2)
hist(exp_s2,exp_hist_x2)                        % 3) plotting the histogram, i.e. the frequency distribution of the sample means from 1)
axis([0 4 0 5000])
ylabel('frequency','FontSize',16)
xlabel('sample average','FontSize',16)
title('sample averages, sample size=2','FontSize',16)
set(gca,'FontSize',16)

exp_hist_x8 = 0:.05:5;
subplot(4,1,3)
hist(exp_s8,exp_hist_x8)  
axis([0 4 0 8000])
ylabel('frequency','FontSize',16)
xlabel('sample average','FontSize',16)
title('sample averages, sample size=8','FontSize',16)
set(gca,'FontSize',16)

exp_hist_x50 = 0:.03:3;
subplot(4,1,4)
hist(exp_s50,exp_hist_x50)     
axis([0 2 0 12000])
ylabel('frequency','FontSize',16)
xlabel('sample average','FontSize',16)
title('sample averages, sample size=50','FontSize',16)
set(gca,'FontSize',16)