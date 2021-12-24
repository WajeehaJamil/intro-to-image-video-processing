clear all;
clc;
I=imread('lena_face.png');
for i=1:6
    step = 256/2^(i+1);
    partition=step:step:256-step;
    codebook=step/2:step:256-(step/2);
    [index,A(i,:)]=quantiz(I(:),partition,codebook);
    figure (i) ;
    imshow(reshape(A(i,:),[256,256]),[0,255])
end
step1 = 256/16;
partition1=step1:step1:256-step1;
codebook1=step1/2:step1:256-(step1/2);
J=I+10*uint8(randn(size(I))); % add the random noise to the original pic

[indx1,QA1]=quantiz(I(:),partition1,codebook1); %quantize the noiseless pic to 16 level.
subplot(1,2,1);
imshow(reshape(QA1,[256,256]),[0,255])

[indx2,QA2]=quantiz(J(:),partition1,codebook1); %quantize the noised pic to 16 level.
subplot(1,2,2);
imshow(reshape(QA2,[256,256]),[0,255])