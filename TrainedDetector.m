clear;
clc;

whaleDetector = vision.CascadeObjectDetector('WhaleDetector.xml');
wakeDetector = vision.CascadeObjectDetector('WakeDetector.xml');
waveDetector = vision.CascadeObjectDetector('WaveDetector.xml');

image = imread('imgs/w_7.jpg');
image = rgb2gray(image);

sWhale = step(whaleDetector, image);
sWake = step(wakeDetector, image);
sWave = step(waveDetector, image);

detectedImg = insertObjectAnnotation(image,'rectangle',sWhale,'whale');
figure; imshow(detectedImg);

fWhale = [];

for w = 1 : size(sWhale, 1)
    
    crop = imcrop(image, sWhale(w, :));
    
    waves = step(waveDetector, crop);
    wakes = step(wakeDetector, crop);
    
    if(isempty(waves) && isempty(wakes))
        fWhale = [fWhale; sWhale(w, :)];
    end
    
end

detectedImg = insertObjectAnnotation(image,'rectangle',fWhale,'whale');
figure; imshow(detectedImg);