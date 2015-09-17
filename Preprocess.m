%% Get all image paths
clear;
clc;

path = 'imgs_subset';
imagePaths = dir(path);

poolobj = parpool(4);

for i = 3 : length(imagePaths)
    ImageProcessingStage(imagePaths(i).name, path, 'ProcessedImages');
end

delete(poolobj);

