%read all the pics
I1=imread('moon.png');
I2=imread('house.png');
I3=imread('spine.jpg');
I4=imread('church.png');

I1equ=histequal(I1);
I2equ=histequal(I2);
I3equ=histequal(I3);
I4equ=histequal(I4);



figure
subplot(2,2,1)
imshow(I1)
subplot(2,2,2)
imshow(I2)
subplot(2,2,3)
imshow(I3)
subplot(2,2,4)
imshow(I4)

figure
subplot(2,2,1)
imshow(I1equ)
subplot(2,2,2)
imshow(I2equ)
subplot(2,2,3)
imshow(I3equ)
subplot(2,2,4)
imshow(I4equ)


figure
subplot(2,2,1)
histogram(I1)
title('Original Moon Histogram')
subplot(2,2,2)
histogram(I2)
title('Original House Histogram')
subplot(2,2,3)
histogram(I3)
title('Original Spine Histogram')
subplot(2,2,4)
histogram(I4)
title('Original Church Histogram')

figure
subplot(2,2,1)
histogram(I1equ)
title('Processed Moon Histogram')
subplot(2,2,2)
histogram(I2equ)
title('Processed House Histogram')
subplot(2,2,3)
histogram(I3equ)
title('Processed Spine Histogram')
subplot(2,2,4)
histogram(I4equ)
title('Processed Church Histogram')

ContrastStretch(I1,0, 255)
ContrastStretch(I2,0, 255)
ContrastStretch(I3,0, 255)
ContrastStretch(I4,0, 255)