images = dir('imgs_subset'); % 'imgs': Folder of images

formatStr = 'neg%d.jpg';   % Output format for negatives
for i=3:size(images, 1)
 imginp = imread(strcat('imgs_subset/', images(i).name));  % Read an image 
 imcropped = imcrop(imginp,[1 1 1078 670]); % Crop
 
 imcropped = rgb2gray(imcropped);
 
hb = ButterHPF(imcropped, 30, 1);

%fourier domain
fI = fftshift(fft2(imcropped));

%apply filter
fI = ifft2(fI .* hb);

fI = abs(fI);
fm = max(fI(:));
fI = fI / fm;
 
 fileName = sprintf(formatStr,i);
 imwrite(fI,strcat('background/', fileName)); % Save negative images
end