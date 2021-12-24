%% |1. Noise generation and restoration|


I=imread('lena.jpg');

%% Gaussion noise
G = imnoise(I,'gaussian',0,0.005);
figure;
subplot(2,2,1);
imshow(I);
title('Original image');
subplot(2,2,2);
imshow(G);
title('Gaussion noisy image');
%% salt & pepper noise
SP=imnoise(I,'salt & pepper', 0.02);
subplot(2,2,3);
imshow(SP);
title('Salt&Pepper noisy image');
%% Rayleigh noise
b=0.02;
noise=sqrt(-b*log(1-rand(size(I,1),size(I,2))));
R=imadd(I,uint8(noise));
subplot(2,2,4);
imshow(R);
title('Rayleigh noisy image');
%% |2. Restoration of Noisy Images|

m=5; 
n=5;
eps =2;
% a) Arithmetic mean filter:
fA = imfilter(G,fspecial('average',[m n]));
% b) Geometric mean filter:
fM = exp(imfilter(log(double(G)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(G) + eps), ones(m, n), 'replicate');
figure;
subplot (2,2,1);
imshow(G); 
title('Gaussian Noisy Image');
subplot (2,2,2); 
imshow(uint8(fA)); 
title('Arithmetic Mean Filter');
subplot (2,2,3); 
imshow(uint8(fM)); 
title('Geometric Mean Filter');
subplot (2,2,4); 
imshow(uint8(fH)); 
title('Harmonic Mean Filter');




% a) Arithmetic mean filter:
fA = imfilter(SP,fspecial('average',[m n]));
% b) Geometric mean filter:
fM = exp(imfilter(log(double(SP)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(SP) + eps), ones(m, n), 'replicate');
figure;
subplot (2,2,1); 
imshow(SP); 
title('salt & pepper noisy image');
subplot (2,2,2); 
imshow(uint8(fA)); 
title('Arithmetic Filter');
subplot (2,2,3); 
imshow(uint8(fM)); 
title('Geometric Filter');
subplot (2,2,4); 
imshow(uint8(fH)); 
title('Harmonic Filter');


% a) Arithmetic mean filter:
fA = imfilter(R,fspecial('average',[m n]));
% b) Geometric mean filter:MATLAB:
fM = exp(imfilter(log(double(R)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(R) + eps), ones(m, n), 'replicate');
figure;
subplot (2,2,1); 
imshow(uint8(R)); 
title('Rayleigh noisy image');
subplot (2,2,2); imshow(uint8(fA)); title('Arithmetic Filter');
subplot (2,2,3); imshow(uint8(fM)); title('Geometric Filter');
subplot (2,2,4); imshow(uint8(fH)); title('Harmonic Filter');

% Arithmetic Mean Filter: In guassian and rayleigh noise is reduced at the expense of
% blurring, better than the others in removing salt&pepper noise

% Geometric: Achieves comparable smoothing to the arithmetic mean filter,
% with less details lost in both guassian and rayleigh noise

% Harmonic: Suitable for Gaussian noise, also remove salt noise but fails for pepper
% noise, it gives best result in rayleigh noise
%% 3. Noise cleaning with Weighted Median Filter

clear all;
I = imread('lena.jpg');
% 'salt & pepper' noise with 0.02 variance
SP = imnoise(I,'salt & pepper',0.02);
figure;
subplot (2,2,1);
imshow(uint8(I));
title('Original Image');
subplot(2,2,2);
imshow(uint8(SP));
title('Salt & Pepper Noisy Image');

n=5;

% FUN is a function handler
FUN=@(x)  median(x(:));
% nlfilter: general sliding neighborhood operations it applies function FUN
% on mxn sliding block of image I
out=nlfilter(SP,[n n], FUN);
subplot (2,2,3);
imshow(uint8(out));
title('Median filter');

W=ones(5);
W(3,3)=5;
FUN=@(x)  median(repelem(x(:),W(:)));
out=nlfilter(SP,[n n], FUN);
subplot (2,2,4);
imshow(out);
title('Weighted Median Filter');