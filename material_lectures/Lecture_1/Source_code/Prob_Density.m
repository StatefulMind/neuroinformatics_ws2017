clear all
close all

% Define Distribution
% Normal distributed with covaraince matrix for 2 random variables

% expected values
mu = [1 -1]; 

% Covaraince
SIGMA = 3*[.9 .4; .4 .3]; 

% 100 Sample
X = mvnrnd(mu,SIGMA,10); 

% Density
min_x = -5;
max_x = 5;
x_vec = min_x:abs(max_x-min_x)/1000:max_x;
for IDX=1:length(x_vec)    
    p(IDX,:) = mvnpdf([x_vec;x_vec.*0+x_vec(IDX)]',mu,SIGMA );     
end; 
p = p./sum(p(:));
% Probaility of coarse intervalls

kernel = ones(40,40);
p2  = conv2(p,kernel,'same');
p2  = p2(1:40:end,1:40:end);

kernel = ones(100,100);
p3  = conv2(p,kernel,'same');
p3  = p3(1:100:end,1:100:end);

% Plot 
subplot(1,3,1)
pcolor(x_vec,x_vec,p)
shading flat
xlabel('x')
ylabel('y')
colorbar
axis square

subplot(1,3,2)
pcolor(x_vec(1:40:end),x_vec(1:40:end),p2)
shading flat
xlabel('x')
ylabel('y')
colorbar
axis square

subplot(1,3,3)
pcolor(x_vec(1:100:end),x_vec(1:100:end),p3)
shading flat
xlabel('x')
ylabel('y')
colorbar
axis square