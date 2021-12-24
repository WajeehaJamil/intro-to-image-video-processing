A=imread('cameraman.tif');
L=[8,9,9.7];
laplacian_img={};
for i=1:numel(L)
    %Laplacian kernel
    kernel=-ones(3,3);
    kernel(2,2)=L(i);
    laplacian_img{i}= imfilter(A,kernel);
    
end

%plot
subplot(2,2,1)
imshow(A)
title('original image');
subplot(2,2,2)
imshow(laplacian_img{1})
title('center value is 8 ');
subplot(2,2,3)
imshow(laplacian_img{2})
title('center value is 9 ');
subplot(2,2,4)
imshow(laplacian_img{3})
title('center value is 9.7');