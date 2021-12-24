%% 1. Image Blurring

I = imread('DIP.jpg'); 
[row, col]=size(I); 
T=1; 
a=0.1; 
b=0.1;

[u, v] = meshgrid(-row/2:row/2-1, -col/2:col/2-1);

H=T./(pi*(u*a+v*b)+eps).*sin(pi*(u*a+v*b)).*exp(-1i*pi*(u*a+v*b));

F = fft2(I);
Fc = fftshift(F);
G = H.*Fc;
gi = ifft2(ifftshift(G));
g = real(gi);% 'blurred'

Fc_2 = fftshift(fft2(g));
invH = Fc_2./(H+0.001); 
% why adding 0.001,If division by values close to zero causes problems, 
% add a small constant value to the denominator.
gi_back = ifft2(ifftshift(invH));
g_back = real(gi_back); % 'restored'

figure
subplot(3,1,1);
imshow(I,[]);
title('original')
subplot(3,1,2); 
imshow(g,[]);
title('blurred')
subplot(3,1,3); 
imshow(g_back,[]);
title('restored')

err = immse(abs(g), double(I));
fprintf('\n The mean-squared error of the motion blurred image is %0.4f\n', err);
err = immse(abs(g_back), double(I));
fprintf('\n The mean-squared error of the restored image is %0.4f\n', err);
%% 2. Image Restoration via Wiener Filtering


noise = sqrt(50)*randn(row,col);
I_degr=g+noise; 

% b. Apply simple inverse filtering to the degraded image (2a)

Fc_inv = fftshift(fft2(I_degr));
InvF  = Fc_inv./(H+0.001);
g_inv = ifft2(ifftshift(InvF));
gi_inv=real(g_inv);

% e. From the convolution theorem, 
% DFT of the blurred image is the product of DFT of the original image and 
% DFT of the blurring kernel.
% Thus, if we know the blurring kernel, dividing DFT of the blurred image 
% by DFT of the blurring kernel, we can recover DFT of the original image.
% Then the inverse frequency filter to get back the image from DFT of original image

% But if we have a noise added to the blurred image then it would not be
% possible to recover the image through inverse filtering

G_wei = fftshift(fft2(I_degr));

% c. Apply the Wiener filter:
Sn = abs(fftshift(fft2(noise))).^2 ; % power spectrum of the noise
Sf = abs(fftshift(fft2(I))).^2 ; % power spectrum of the undegraded image
k= Sn./Sf;
absH = H.*conj(H);
W=(1./(H+eps)).*(absH)./(absH+k).*G_wei;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);


figure(2)
subplot(1,3,1);
imshow(I_degr,[]); title('blurred+noisy');
subplot(1,3,2);
imshow(gi_inv,[]); title('inverse filtering');  
subplot(1,3,3);
imshow(W_image,[]); title('Wiener filtering');

% f. if we dont know the signal to noise ratio we then guess the value of
% k as we do in the following code
figure(3)
W=(1./(H+eps)).*(absH)./(absH+0.005).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,1);
imshow(W_image,[]); title('k=0.005');
W=(1./(H+eps)).*(absH)./(absH+0.002).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,2);
imshow(W_image,[]); title('k=0.002');
W=(1./(H+eps)).*(absH)./(absH+0.001).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,3);
imshow(W_image,[]); title('k=0.001');