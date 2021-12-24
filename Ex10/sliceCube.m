function [K] = sliceCube(I,dist)
    IR=double(I(:,:,1));
    IG=double(I(:,:,2));
    IB=double(I(:,:,3));
    t=impixel(I);
    C=mean(t,1);
    CR=C(1);
    CG=C(2);
    CB=C(3);
    Cmask=uint8(abs(IR-CR)+abs(IG-CG)+abs(IB-CB)<=dist);
    Cmask=double(repmat(Cmask,[1,1,3]));
    CmaskR=Cmask(:,:,1);
    CmaskG=Cmask(:,:,2);
    CmaskB=Cmask(:,:,3);
    
    K=cat(3,CmaskR.*IR,CmaskG.*IG,CmaskB.*IB);
end
    
    