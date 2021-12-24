function [I]= ContrastStretch(I)
    Min = min(I(:));
    Max = max(I(:));
    n = length(I);
    for i=1:n
        for j=1:n
            if Min<I(i,j)<Max
                I(i,j)=255/(Max-Min)*(I(i,j)-Min);
            end
        end
    end

end