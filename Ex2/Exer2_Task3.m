%%
clear all
% Set the length and width of the picture
m = 400;
n = 400;
% Set the bottom gray level of the first picture
ground_gray1 = 63;
X1 = ones(m,n)*ground_gray1;
% Set the bottom gray level of the second image
ground_gray2 = 223;
X2 = ones(m,n)*ground_gray2;
% Set common surface gray scale
front_gray = 127;
% Set the position of the point on the upper left corner of the surface
m0 = 160;
n0 = 160;
% Surface width
step = 80;
% Assign value to surface gray level
X1(m0:m0+step,n0:n0+step) = front_gray;
% Show comparison chart
figure,imshow(uint8(X1));
title("front=127, ground=63")
X2(m0:m0+step,n0:n0+step)=front_gray;
figure,imshow(uint8(X2));
title("front=127, ground=223")

% changing the small square gray level to make it equally bright in both

front_gray = 130;
% Assign value to surface gray level
X1(m0:m0+step,n0:n0+step) = front_gray;
% Show comparison chart
figure,imshow(uint8(X1));
title("front=130, ground=63")
X2(m0:m0+step,n0:n0+step)=front_gray;
figure,imshow(uint8(X2));
title("front=130, ground=223")