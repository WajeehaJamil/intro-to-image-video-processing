%%task 4
% a
I=imread('moon.png');
Iequ=histeq(I);
Iequ2 = histeq(Iequ);
figure
subplot(2,2,1)
imshow(Iequ)
subplot(2,2,2)
histogram(Iequ)
subplot(2,2,3)
imshow(Iequ2)
subplot(2,2,4)
histogram(Iequ2)
% no change, the value of the histogram equalization does not change 
% when it is multiplied by itself. 

% b
%after using the localized histogram equalization, the image will look
%better and more details can be seen.