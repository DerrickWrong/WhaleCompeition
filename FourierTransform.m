function [ fimage ] = FourierTransform( image )
%FOURIERTRANSFORM 

fimage = fft2(double(image));
fimage = fftshift(fimage);
fimage = abs(fimage);
fimage = log(fimage + 1);
fimage = mat2gray(fimage);

end

