clc, clear all;
I1=imread('cheetah.jpg');
I2=imread('chameleon.jpg');
dist=100;

K1=sliceCube(I1,dist);
figure;imshow(K1);title('using sliceCube')
K2=sliceSphere(I1,dist);
figure;imshow(K2);title('using sliceSphere')

K3=sliceCube(I2,dist);
figure;imshow(K3);title('using sliceCube')
K4=sliceSphere(I2,dist);
figure;imshow(K4);title('using sliceSphere')

%%
% a)
clear all;
I = imread('lena.tiff');
I_hsi=rgb2hsi(I);
figure;
subplot(2,3,1);imshow(I(:,:,1),[]);title('R channel');
subplot(2,3,2);imshow(I(:,:,2),[]);title('G channel');
subplot(2,3,3);imshow(I(:,:,3),[]);title('B channel');
subplot(2,3,4);imshow(I_hsi(:,:,1),[]);title('H channel');
subplot(2,3,5);imshow(I_hsi(:,:,2),[]);title('S channel');
subplot(2,3,6);imshow(I_hsi(:,:,3),[]);title('I channel');

% b)
J_G = imnoise(I(:,:,2),'gaussian');
I1=cat(3,I(:,:,1),J_G,I(:,:,3));
figure;
imshow(I1);title('with noisy green channel R/G/B');
I1_hsi=rgb2hsi(I1);
figure;
imshow(I1_hsi);title('with noisy green channel H/S/I');
figure;
subplot(2,3,1);imshow(I1(:,:,1),[]);title('R channel');
subplot(2,3,2);imshow(I1(:,:,2),[]);title('noisy G channel');
subplot(2,3,3);imshow(I1(:,:,3),[]);title('B channel');
subplot(2,3,4);imshow(I1_hsi(:,:,1),[]);title('H channel');
subplot(2,3,5);imshow(I1_hsi(:,:,2),[]);title('S channel');
subplot(2,3,6);imshow(I1_hsi(:,:,3),[]);title('I channel');

% even after applying guassian noise only on the green component of RGB
% image, after converting it to HSI color space it can be seen that HSI
% model carries the noise to all of its components hue, saturation and
% intensity.

% c)
J_R = imnoise(I(:,:,1),'gaussian');
J_G = imnoise(I(:,:,2),'gaussian');
J_B = imnoise(I(:,:,3),'gaussian');
I2=cat(3,J_R,J_G,J_B);

figure;
imshow(I2);
title('with noisy R/G/B channel');
I2_hsi=rgb2hsi(I2);
figure;
imshow(I2_hsi);
title('with noisy H/S/I channel');
figure;
subplot(2,3,1);imshow(I2(:,:,1),[]);title('noisy R channel');
subplot(2,3,2);imshow(I2(:,:,2),[]);title('noisy G channel');
subplot(2,3,3);imshow(I2(:,:,3),[]);title('noisy B channel');
subplot(2,3,4);imshow(I2_hsi(:,:,1),[]);title('noisy H channel');
subplot(2,3,5);imshow(I2_hsi(:,:,2),[]);title('noisy S channel');
subplot(2,3,6);imshow(I2_hsi(:,:,3),[]);title('noisy I channel');

% d)
m = 3;
n = 3;

I2_f = imfilter(I2,fspecial('average',[m n]));
figure;imshow(I2_f,[]);title('filter noisy R/G/B channel');

I2R_f = imfilter(I2(:,:,1),fspecial('average',[m n])); 
I2G_f = imfilter(I2(:,:,2),fspecial('average',[m n])); 
I2B_f = imfilter(I2(:,:,3),fspecial('average',[m n])); 

I2_hsi_f = imfilter(I2_hsi,fspecial('average',[m n])); 
figure;imshow(I2_hsi_f,[]);title('filter noisy H/S/I channel');

I2h_hsi_f= imfilter(I2_hsi(:,:,1),fspecial('average',[m n]));
I2s_hsi_f = imfilter(I2_hsi(:,:,2),fspecial('average',[m n]));
I2i_hsi_f = imfilter(I2_hsi(:,:,3),fspecial('average',[m n]));

HSI=cat(3,I2h_hsi_f, I2s_hsi_f ,I2i_hsi_f);
HSI_1=hsi2rgb(cat(3,I2h_hsi_f, I2_hsi(:,:,2),I2_hsi(:,:,3)));
HSI_2=hsi2rgb(cat(3,I2_hsi(:,:,1), I2s_hsi_f,I2_hsi(:,:,3)));
HSI_3=hsi2rgb(cat(3,I2_hsi(:,:,1), I2_hsi(:,:,2),I2i_hsi_f));
RGB=hsi2rgb(I2_hsi_f);
figure;
imshow(HSI_1);
figure;
imshow(HSI_2);
figure;
imshow(HSI_3);

% applying the filter on the intensity I components of HSI image and then
% converting back to rgb color space seems to be a good option as
% compared to the other channels