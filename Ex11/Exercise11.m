%% Task 1


load('yuvdata.mat');
% a) there are differences.yy is four times the size of uu and vv.

%% b)
reshaped_yy=reshape(yy, cols,rows);
reshaped_uu=reshape(uu, cols/2, rows/2);
reshaped_vv=reshape(vv, cols/2, rows/2);
%plot
figure;
subplot(3,1,1);imshow(imrotate(flip(imresize(reshaped_yy,size(reshaped_yy))), -90), []);title('Y component');
subplot(3,1,2);imshow(imrotate(flip(imresize(reshaped_uu,size(reshaped_uu))), -90), []);title('U component');
subplot(3,1,3);imshow(imrotate(flip(imresize(reshaped_vv,size(reshaped_vv))), -90), []);title('V component');

%% c)
reshaped_uu=imresize(reshaped_uu, size(reshaped_yy))-127;
reshaped_vv=imresize(reshaped_vv, size(reshaped_yy))-127;
% d)
YUV=cat(2, reshaped_yy(:), reshaped_uu(:), reshaped_vv(:));
YuvToRgb=[1 0 1.402;1 -0.34413 -0.71414;1 1.772 0];
% e)
RGB=YuvToRgb*YUV';
% f)
R=reshape(RGB(1, :), cols, rows);
G=reshape(RGB(2, :), cols, rows);
B=reshape(RGB(3, :), cols, rows);
I=cat(3, R, G, B);
I=uint8(I);
figure;imshow(imrotate(flip(I), -90), []);
%% Task 2


I=imread('lena.tiff');
% a)
YCbCr=rgb2ycbcr(I);
Y=YCbCr(:,:,1);
Cb=YCbCr(:,:,2);
Cr=YCbCr(:,:,3);
figure;
subplot(1,3,1);imshow(Y);title('Y component');
subplot(1,3,2);imshow(Cb);title('Cb component');
subplot(1,3,3);imshow(Cr);title('Cr component');

%b)
figure;
subplot(2,3,1);imshow(I);title('Original Image');

%4:2:2
Cb(:, 2:2:end)=Cb(:, 1:2:end-1);
Cr(:, 2:2:end)=Cr(:, 1:2:end-1);
J22=cat(3,Y,Cb,Cr);
I422=ycbcr2rgb(J22);

subplot(2,3,2);imshow(I422);title('4:2:2 Subsampled');

%% 4:1:1
Cb1=repelem(Cb(:, 1:4:end-3),1,4);
Cr1=repelem(Cr(:, 1:4:end-3),1,4);
J11=cat(3,Y,Cb1,Cr1);
I411=ycbcr2rgb(J11);

subplot(2,3,3);imshow(I411);title('4:1:1 Subsampled');

%% 4:2:0
Cb20=repelem(Cb(1:4:end-3,1:2:end-1),4,2);
Cr20=repelem(Cr(1:4:end-3,1:2:end-1),4,2);
J20=cat(3,Y,Cb20,Cr20);
I420=ycbcr2rgb(J20);

subplot(2,3,4);imshow(I420);title('4:2:0 Subsampled');

%% luminance 4:2:0
Y20=repelem(Y(1:4:end-3,1:2:end-1),4,2);
J201=cat(3,Y20,Cb,Cr);
I4201=ycbcr2rgb(J201);

subplot(2,3,5);imshow(I4201);title('Luminance 4:2:0 Subsampled');

% error measure
error1=immse(I,I422)
error2=immse(I,I411)
error3=immse(I,I420)
error4=immse(I,I4201)

% First 3 subsampled images are pretty much the same that's why there mean
% squared error values are less except the 4th luminance subsampled one
% which is much different.