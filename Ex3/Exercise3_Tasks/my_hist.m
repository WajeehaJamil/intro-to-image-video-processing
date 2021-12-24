function [my_hist] = my_hist(I)
    n=length(I);
    [M,N]=size(I);
    my_hist= zeros(1,n);
    d=1/M/N;
    for i=1:n
        for j=1:n
            my_hist(I(i,j)+1)=my_hist(I(i,j)+1)+d;
        end
    end
end