function [J] = intensityeq(I)
    hsvimg=rgb2hsv(I);
    hchannel=hsvimg(:,:,1);
    schannel=hsvimg(:,:,2);
    vchannel=histeq(hsvimg(:,:,3)); % only apply histeq to value (v) component of hsv image
    K=cat(3,hchannel,schannel,vchannel);
    J=hsv2rgb(K);
end
    
    
    