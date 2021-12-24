S1S2 = [0 0 0 0 0 0 0 1 1 0
    1 0 0 1 0 0 1 0 0 1
    1 0 0 1 0 1 1 0 0 0
    0 0 1 1 1 0 0 0 0 0
    0 0 1 1 1 0 0 1 1 1];
imshow(S1S2, 'InitialMagnification', 'fit' );

S1 = S1S2(1:4,2:5);
S2 = S1S2(1:4, 6:9);

fprintf("Total number of non-zero values is %d \n",count(S1));

fprintf("Total number of non-zero values is %d \n", count(S2));

load S.mat;
fprintf("Total number of non-zero values is %d \n", count(S))

function count = count(S)
    count = nnz(S);
end