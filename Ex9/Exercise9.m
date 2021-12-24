%% 1. Histogram Equalization for Color Images

clear all;
%load two imgs
I1=imread('fruits.jpg');
I2=imread('festia.jpg');

%apply histeq function independently on each of R, G, and B components
I1R=histeq(I1(:,:,1));
I1G=histeq(I1(:,:,2));
I1B=histeq(I1(:,:,3));
I11=cat(3,I1R,I1G,I1B);

I2R=histeq(I2(:,:,1));
I2G=histeq(I2(:,:,2));
I2B=histeq(I2(:,:,3));
I21=cat(3,I2R,I2G,I2B);

%using intensityeq function
J1=intensityeq(I1);
J2=intensityeq(I2);

%plot
figure;
subplot(2,3,1);imshow(I1);title('Original');
subplot(2,3,2);imshow(I11);title('histeq');
subplot(2,3,3);imshow(J1);title('HSV histeq');
subplot(2,3,4);imshow(I2);title('Original');
subplot(2,3,5);imshow(I21);title('histeq');
subplot(2,3,6);imshow(J2);title('HSV histeq');

% Applying histogram equalization to rgb color space leads to inappropriate
% changes in the image color balance as Equalization involves intensity values of the image, 
% not the color components
% histeq needs to be applied such that intensity values are equalized without disturbing 
% the color balance of the image
% So,if the image is first converted to another color space, like HSV color
% space,(which separates intensity values from color components)
% then the histeq algo can be applied to the value channel without resulting in 
% changes to the hue and saturation of the image.
%% 2. Object Extraction

clear all
I = imread('lake.jpg');
I1 = rgb2hsv(I); %change the color space
level=graythresh(I1); % to get normalized intensity values that lies in range [0,1] 
% used before converting intensity image to binary image

bw = im2bw(I1,level); % to get the binary image

[L,num] = bwlabel(bw); % to get a matrix L, containing labels for connected components
% 0->background, 1->represent 1 object, 2->represent second object

% to store total number of pixels of each object
matrix = zeros(1,num);
for i = 1 : num
    matrix(i) = length(find(L(:) == i));
end
% find the object with maximum pixels 
[a, idx] = max(matrix);

% find the target object->biggest lake
bw1 = (L==idx);

% construct the pixels
d11=repmat(bw1(:), 1, 3); 
d1=reshape(d11,size(I));
d2=uint8(d1).*I;

figure;
imshow(I);
title('original image');
figure;
imshow(bw);
title('binary image');
figure;
imshow(uint8(L));
title('labeled image');
figure;
imshow(d2);
title('extracted object');
%%