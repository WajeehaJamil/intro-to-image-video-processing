I = imread('peppers.png');

I1 = rgb2gray(I);

figure, imshow(I(:,:,1));
title('Only Red 1st Component');

%[R, G, B] = imsplit(I);
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
I2 = cat(3,R,G+50, B);

I3 = cat(3, B, G, R);

figure, subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2,2,2);
imshow(I1);
title('Grayscale Image');

subplot(2,2,3);
imshow(I2);
title('After Adding 50 to G')

subplot(2,2,4);
imshow(I3)
title('Reordering to BGR')


