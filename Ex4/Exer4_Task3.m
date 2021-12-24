A=imread('church.png');
B=imread('corel.png');
C= histmatch(A,B);

figure,imshow(A)
title('the target image')
figure,imshow(B)
title('the reference image')
figure,imshow(C)
title('the histogram matching image')

figure
subplot(3,1,1);
histogram(A)
subplot(3,1,2);
histogram(B)
subplot(3,1,3);
histogram(C)