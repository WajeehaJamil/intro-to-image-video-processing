A=(0:1:255) %create a vector from 0 to 255.
step=256/4 % the quantity used in quant command, 64
QA1=quant(A, step)  % discretize vector values to multiples of 64
partition = step:step:256-step % it means that in the position of 64th, 128th ,192th 
% we have to change the value taken from the codebook respectively.
codebook = step/2:step:256-step/2 %the output values are taken from here.
[indx,QA2] = quantiz(A, partition, codebook) %quantize the vector A in such way that 
% we give the value which is from codebook according to the partition respectively.
C=unique(QA1) %get the unique values in quantized vectors QA1
D=unique(QA2) %get the unique values in quantized vectors QA2