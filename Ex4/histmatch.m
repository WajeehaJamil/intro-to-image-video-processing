function [C] = histmatch(tar, ref)
    %cdf
    function cdf =img_cdf(img)
        bins=0:255;
        H=hist(img(:),bins);
        cdf=cumsum(H)/sum(H);
    end
    cdf_tar=img_cdf(tar);
    cdf_ref=img_cdf(ref);
    for i =1:256
        % try to find most matchable gray level
        [~,n]=min(abs(cdf_ref-cdf_tar(i)));
        M(i) = n;
    end
    % reconstruct image
    C=M(tar+1)/255;
end