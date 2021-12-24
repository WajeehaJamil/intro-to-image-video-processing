%read image and add noise
clear all;
img=imread('cameraman.tif');
noisy_img=img+uint8(randn(size(img))*10);
figure
subplot(1,2,1);
imshow(img);
title('original image');
subplot(1,2,2);
imshow(noisy_img);
title('Noisy Image');

size=[3,5,7];
[img0_1,img45_1,img90_1,img135_1]=directional_filtering(noisy_img,size(1));
[img0_2,img45_2,img90_2,img135_2]=directional_filtering(noisy_img,size(2));
[img0_3,img45_3,img90_3,img135_3]=directional_filtering(noisy_img,size(3));
figure
subplot(2,2,1)
imshow(uint8(img0_1))
title('0 degree of size 3');
subplot(2,2,2)
imshow(uint8(img45_1))
title('45 degree of size 3');
subplot(2,2,3)
imshow(uint8(img90_1))
title('90 degree of size 3');
subplot(2,2,4)
imshow(uint8(img135_1))
title('135 degree of size 3');

figure
subplot(2,2,1)
imshow(img0_2)
title('0 degree of size 5');
subplot(2,2,2)
imshow(img45_2)
title('45 degree of size 5');
subplot(2,2,3)
imshow(img90_2)
title('90 degree of size 5');
subplot(2,2,4)
imshow(img135_2)
title('135 degree of size 5');

figure
subplot(2,2,1)
imshow(img0_3)
title('0 degree of size 7');
subplot(2,2,2)
imshow(img45_3)
title('45 degree of size 7');
subplot(2,2,3)
imshow(img90_3)
title('90 degree of size 7');
subplot(2,2,4)
imshow(img135_3)
title('135 degree of size 7');

for k=size
    [img0,img45,img90,img135]=directional_filtering(noisy_img,k);
    figure
    subplot(1,2,1);
    imshow(noisy_img);
    title('Noisy Image');
    % Averaging result
    filter_img=(img0+img45+img90+img135)/4;
    subplot(1,2,2);
    imshow(filter_img);
    title('Combined filtering result');
end