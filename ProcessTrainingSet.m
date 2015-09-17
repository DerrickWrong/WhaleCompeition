clc;
clear;

load('filteredWhaleLabels.mat');

formatStr = 'neg%d_%d.jpg';   % Output format for negatives

poolobj = parpool(4);

parfor i = 1 : length(negativeInstances)
    
    imagefile = negativeInstances(i).imageFilename;
    img = imread(imagefile);
    boxes = negativeInstances(i).objectBoundingBoxes;
    
    for ii = 1 : size(boxes, 1) 
         imcropped = imcrop(img, boxes(ii,:));
         fileName = sprintf(formatStr, i, ii);
         imwrite(imcropped, strcat('background/', fileName));
    end

end

delete(poolobj);