
function AddNoiseImage(filename, Noise_spatial_kernel)

clear all
close all
Noise_spatial_kernel =2
NR_frames   = 100;
filename    = 'apple_normal.JPG'
Image_Data  = imread(filename);
Image_Data  = squeeze(mean(Image_Data,3));
imagesc(Image_Data)
colormap(gray)
%Noise_spatial_kernel =5;
flag_filter_noise    = 1;


kernel      = normpdf(-3*Noise_spatial_kernel:1:3*Noise_spatial_kernel,0,Noise_spatial_kernel)
kernel      = kernel'*kernel;
max_val     = max(Image_Data(:));
min_val     = min(Image_Data(:));

Scaled_Image = (Image_Data-min_val)./(max_val-min_val);
Scaled_Image = Scaled_Image-0.5;

Noise_ratio                 = 0.9;                      % between 0 and 1 : 0 no noise , 1 only noise
Noise_funtion               = 'uniform';


Noise_eff_ratio             = Noise_ratio/2;          % between 0 and 1
Picture__brightness_range   = [Noise_eff_ratio  1-Noise_eff_ratio]-0.5;

for IDX = [75,80,85,90]
    Noise_ratio                 = IDX/NR_frames;
    Noise_eff_ratio             = Noise_ratio/2;          % between 0 and 1
    Picture__brightness_range   = [Noise_eff_ratio  1-Noise_eff_ratio]-0.5;
    Scaled_Image_B              = Scaled_Image*(1-2*Noise_eff_ratio);
    Added_noise                 = (rand(size(Scaled_Image_B))-0.5)*Noise_eff_ratio;
    if flag_filter_noise    == 1;
        Added_noise             = conv2(Added_noise,kernel,'same');
        scale_noise             = Noise_eff_ratio./max(abs(Added_noise(:)));
        Added_noise             = Added_noise*scale_noise ;
    end
    new_image                   = Scaled_Image_B+Added_noise;
    
    axis off
    truesize
    
    
    figure
    imagesc(new_image)
    colormap(gray)
    axis off
    truesize
    
end



figure
colormap(gray)
for IDX =1:NR_frames 
    %Noise_ratio                 = 21/NR_frames ;
    Noise_eff_ratio             = Noise_ratio/2;          % between 0 and 1
    Picture__brightness_range   = [Noise_eff_ratio  1-Noise_eff_ratio]-0.5;
    Scaled_Image_B              = Scaled_Image*(1-2*Noise_eff_ratio);
    Added_noise                 = (rand(size(Scaled_Image_B))-0.5)*Noise_eff_ratio; 
    if flag_filter_noise    == 1;
        Added_noise             = conv2(Added_noise,kernel,'same'); 
        scale_noise             = Noise_eff_ratio./max(abs(Added_noise(:)));
        Added_noise             = Added_noise*scale_noise ;
    end
    new_image                   = Scaled_Image_B+Added_noise;
    %subplot(5,5,IDX)
    imagesc(new_image)
    F(IDX) = getframe;
end
movie(F,10)
