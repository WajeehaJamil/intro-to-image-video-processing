% Question3: Brightness adaption

% Question4:
% (a) When we add a constant c to the image g(x,y), the x-axis move to right(when c>1) by
% c times or move to left(when c<1) by c times.
clear all;
I=imread('peppers.png');
G = imadd(I,30);
subplot(2,1,1)
histogram(I)
subplot(2,1,2)
histogram(G)
%(b) The shape will be stretched c times if c >1 and shrinked to c times if
%c < 1.However the values will remain the same
J = immultiply(I,1.1);
figure
subplot(2,1,1)
histogram(I,256)
subplot(2,1,2)
histogram(J)
%(c) When we rotate the image g(x,y) by 90 clockwise, nothing changes.
R = imrotate(I,90);
figure
subplot(2,1,1)
histogram(I)
subplot(2,1,2)
histogram(R)