function [I1,lookup] = histequal(I)
    [M,N] = size(I);
    Hist= zeros(1,256);
    d= 1/M/N;
    % computing the original image histogram
    for i=1:M
        for j=1:N
            Hist(I(i,j)+1)= Hist(I(i,j)+1)+d;
        end
    end
    % computing CDF (cummulative distribution function) i.e, accumulating
    % the hstogram values
    sum=0;
    for t=1:1:256
        sum= sum+Hist(t);
        lookup(t)=sum*255+0.5;
    end
    % modify the intensities of original image according to the obtained
    % mapping (from lookup table)
    for i=1:M
        for j=1:N
            I1(i,j)=uint8(lookup(I(i,j)+1));
        end
    end
end
        
        