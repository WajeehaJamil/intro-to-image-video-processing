function [dft,g] = DFT(I)
    % Obtain the fourier transform
    F = fft2(I);
    % Move the zero-frequency component to center of the matrix
    Fc= fftshift(F);
    % To display the transform take the absolute value and also apply
    % logarithm
    dft=log(abs(Fc)+0.0001);
    H = ones(size(I));
    G= H.*Fc;
    gi= ifft2(ifftshift(G));
    g= real(gi);
end
    
    