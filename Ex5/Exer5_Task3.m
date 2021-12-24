clear all;
I=imread('miranda1.tif');
noise=zeros(size(I));
noise(151:250,151:250)=50*rand(100,100);
Inoise=I+uint8(noise);
figure;
subplot(1,2,1);
imshow(I);
title('original image');
subplot(1,2,2);
imshow(Inoise);
title('noisy image');

%% median filtering
sizes=3:2:7;
filtered = med_filter(Inoise,sizes(1));
figure;
subplot(1,2,1);
imshow(Inoise);
title('Noisy image size 3');
subplot(1,2,2); 
imshow(filtered);
title('Median filtered image size 3');
    
figure;
alpha=50;
thrfiltered = thre_med_filter(Inoise,sizes(1),alpha);
subplot(1,2,1); 
imshow(Inoise);
title('Noisy image size 3');
subplot(1,2,2);
imshow(thrfiltered);
title('Threshold median filtered size 3');

filtered = med_filter(Inoise,sizes(2));
figure;
subplot(1,2,1);
imshow(Inoise);
title('Noisy image size 5');
subplot(1,2,2); 
imshow(filtered);
title('Median filtered image size 5');
    
figure;
alpha=100;
thrfiltered = thre_med_filter(Inoise,sizes(2),alpha);
subplot(1,2,1); 
imshow(Inoise);
title('Noisy image size 5');
subplot(1,2,2);
imshow(thrfiltered);
title('Threshold median filtered size 5');

filtered = med_filter(Inoise,sizes(3));
figure;
subplot(1,2,1);
imshow(Inoise);
title('Noisy image size 7');
subplot(1,2,2); 
imshow(filtered);
title('Median filtered image size 7');
    
figure;
alpha=50;
thrfiltered = thre_med_filter(Inoise,sizes(3),alpha);
subplot(1,2,1); 
imshow(Inoise);
title('Noisy image size 7');
subplot(1,2,2);
imshow(thrfiltered);
title('Threshold median filtered size 7');


%%
function filtered = med_filter(I,kernel_size)
[m, n]=size(I);
k2=kernel_size-1;
filtered=uint8(zeros(m-k2,n-k2));

%k=(kernel_size+1)/2;

for i=1:m-k2
    for j=1:n-k2
        patch=I(i:i+k2,j:j+k2);        
        filtered(i,j)=median(patch(:));
    end
end
end 

function filtered = thre_med_filter(I,kernel_size,alpha)
[m, n]=size(I);
filtered=uint8(zeros(m-2,n-2));

k=(kernel_size+1)/2;
for i=1:m-k
    for j=1:n-k
        patch=I(i:i+k,j:j+k); 
            if abs(median(patch(:))-I(i,j))<alpha;
                filtered(i,j)=median(patch(:));
            else
                filtered(i,j)=I(i,j);
            end
    end
end
end