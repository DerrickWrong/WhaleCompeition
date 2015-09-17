function [] = ImageProcessingStage( imagefile, imagePath, imageOutputPath )
%IMAGEREDUCTION  

I = imread(strcat(imagePath, '/', imagefile));
I = rgb2gray(I); 

%histogram shift
I = I - 50; 
I(I > 90) = 0;

hb = ButterHPF(I, 30, 1);

%fourier domain
fI = fftshift(fft2(I));

%apply filter
fI = ifft2(fI .* hb);

fI = abs(fI);
fm = max(fI(:));
fI = fI / fm;

% texture segmentation
%E = entropyfilt(fI);
%Eim = mat2gray(E);
%BW1 = im2bw(Eim, 0.8);
%BWao = bwareaopen(BW1, 2000);

%output the image
imwrite(fI, strcat(imageOutputPath, '/', imagefile));
 
end

