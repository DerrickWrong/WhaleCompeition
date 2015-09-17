clear;
clc;

load('ExportedLabels.mat');

%% create negative images
filename = 'negativeImages_whale';
mkdir(filename);

for i = 1 : size(ExportWakes, 2)
    
    image = imread(ExportWakes(i).imageFilename);
    
    for ii = 1 : size(ExportWakes(i).objectBoundingBoxes)
        
        imgCrop = imcrop(image, ExportWakes(i).objectBoundingBoxes(ii, :));
        
        fn = strcat(filename, '/wake_', num2str(i), '_', num2str(ii), '.jpg');
        fprintf([fn, '\n']);
        imwrite(imgCrop, fn);
    end
end

for i = 1 : size(ExportWaves, 2)
    image = imread(ExportWaves(i).imageFilename);
    
    for ii = 1 : size(ExportWaves(i).objectBoundingBoxes)
        
        imgCrop = imcrop(image, ExportWaves(i).objectBoundingBoxes(ii, :));
        
        fn = strcat(filename, '/wave_', num2str(i), '_', num2str(ii), '.jpg');
        fprintf([fn, '\n']);
        imwrite(imgCrop, fn);
    end
end

trainCascadeObjectDetector('WhaleDetector.xml', ExportWhaleHeads, filename, 'NumCascadeStages', 9,'FalseAlarmRate',0.01,'FeatureType','Haar');










 